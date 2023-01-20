import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../core/di/inject.dart';
import '../../util/assets.dart';
import '../../util/colors.dart';
import '../widgets/custom_input_widget.dart';
import '../widgets/popup_widget.dart';
import '/presentation/widgets/custom_button.dart';
import 'cubit/message_cubit.dart';
import 'cubit/message_state.dart';

class MessagePage extends StatefulWidget {
  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final _messageCubit = get<MessageCubit>();
  bool _keyboardVisible = false;

  late StreamSubscription<bool> keyboardSubscription;

  late KeyboardVisibilityController keyboardVisibilityController;

  @override
  void initState() {
    super.initState();
    keyboardVisibilityController = KeyboardVisibilityController();

    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() => _keyboardVisible = visible);
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => _messageCubit,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _keyboardVisible
            ? const SizedBox()
            : CircleAvatar(
                backgroundColor: AppColors.secondary,
                radius: 30,
                child: SizedBox(
                  height: 65,
                  width: 65,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: AppColors.secondary,
                    onPressed: () async => showPhoneSelectDialog(),
                    child: SvgPicture.asset(
                      Assets.call,
                      height: 25,
                    ),
                  ),
                ),
              ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.background),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              child: Column(
                children: [
                  SizedBox(height: height.height * 0.04),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.communication,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        PopUpWidget(),
                      ],
                    ),
                  ),
                  _keyboardVisible
                      ? Container()
                      : Column(
                          children: [
                            SizedBox(height: height.height * 0.05),
                            Center(child: SvgPicture.asset(Assets.app_logo)),
                            const SizedBox(height: 15),
                          ],
                        ),
                  BlocBuilder<MessageCubit, MessageState>(
                    builder: (context, state) => ListView(
                      shrinkWrap: true,
                      children: [
                        CustomInputWidget(
                          hintText: AppLocalizations.of(context)!.name,
                          keyboardType: TextInputType.name,
                          onChanged: (name) => _messageCubit.onName(name),
                        ),
                        CustomInputWidget(
                          hintText: AppLocalizations.of(context)!.emailOrPhone,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (emailOrPhone) =>
                              _messageCubit.onEmailOrPhone(emailOrPhone),
                        ),
                        CustomInputWidget(
                          hintText: AppLocalizations.of(context)!.message,
                          keyboardType: TextInputType.text,
                          onChanged: (message) =>
                              _messageCubit.onMessage(message),
                        ),
                        const SizedBox(height: 8),
                        CustomButton(
                          buttonText: AppLocalizations.of(context)!.send,
                          color:
                              !_messageCubit.name || !_messageCubit.emailOrPhone
                                  ? AppColors.disabledColor
                                  : AppColors.primary,
                          onTap:
                              !_messageCubit.name || !_messageCubit.emailOrPhone
                                  ? null
                                  : () {
                                      if (state.name!.isNotEmpty ||
                                          state.emailOrPhone!.isNotEmpty) {
                                        _messageCubit.sendEmail();
                                      }
                                    },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showPhoneSelectDialog() async {
    final phoneList = ['0 312 91 19 19', '0 559 91 14 44', '0 707 91 14 44'];

    await showModalBottomSheet(
        isDismissible: true,
        context: context,
        builder: (context) {
          return SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: phoneList.length,
              itemBuilder: (BuildContext context, int index) {
                final MediaQueryData data = MediaQuery.of(context);
                return GestureDetector(
                  onTap: () {
                    _messageCubit
                        .makeCall(phoneList[index])
                        .then((_) => context.pop());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MediaQuery(
                      data: data.copyWith(
                          boldText: false,
                          textScaleFactor: data.textScaleFactor > 1.0
                              ? 1.0
                              : data.textScaleFactor),
                      child: Text(
                        phoneList[index],
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
