import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ok_radio_flutter/application/cubit/app_cubit.dart';
import 'package:ok_radio_flutter/core/navigation/navigation.dart';
import 'package:ok_radio_flutter/core/navigation/router.gr.dart';
import 'package:ok_radio_flutter/util/styles.dart';

import '../../application/cubit/app_state.dart';
import '../../core/di/inject.dart';
import '../../util/assets.dart';
import '../../util/colors.dart';
import '../widgets/custom_input_widget.dart';
import '/presentation/widgets/custom_button.dart';
import 'cubit/message_cubit.dart';
import 'cubit/message_state.dart';

class MessagePage extends StatelessWidget {
  final _messageCubit = get<MessageCubit>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => _messageCubit,
      child: Scaffold(
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
                        const Text(
                          'Связаться с эфиром',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        PopUpWidget(),
                      ],
                    ),
                  ),
                  SizedBox(height: height.height * 0.05),
                  Center(child: SvgPicture.asset(Assets.app_logo)),
                  const SizedBox(height: 45),
                  BlocBuilder<MessageCubit, MessageState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          CustomInputWidget(
                            hintText: 'Имя*',
                            keyboardType: TextInputType.name,
                            onChanged: (name) => _messageCubit.onName(name),
                          ),
                          CustomInputWidget(
                            hintText: 'Email или номер телефона*',
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (emailOrPhone) =>
                                _messageCubit.onEmailOrPhone(emailOrPhone),
                          ),
                          CustomInputWidget(
                            hintText: 'Ваше сообщение',
                            keyboardType: TextInputType.text,
                            onChanged: (message) =>
                                _messageCubit.onMessage(message),
                          ),
                          const SizedBox(height: 22),
                          CustomButton(
                            buttonText: 'Отправить',
                            color: !_messageCubit.name ||
                                    !_messageCubit.emailOrPhone
                                ? AppColors.disabledColor
                                : AppColors.primary,
                            onTap: !_messageCubit.name ||
                                    !_messageCubit.emailOrPhone
                                ? null
                                : () {
                                    if (state.name!.isNotEmpty ||
                                        state.emailOrPhone!.isNotEmpty) {
                                      _messageCubit.save();
                                    }
                                  },
                          )
                        ],
                      );
                    },
                  ),
                  Expanded(child: const SizedBox(height: 20)),
                  CircleAvatar(
                    backgroundColor: AppColors.secondary,
                    radius: 40,
                    child: SizedBox(
                      height: 65,
                      width: 65,
                      child: FloatingActionButton(
                        elevation: 0,
                        backgroundColor: AppColors.secondary,
                        onPressed: () async {},
                        child: SvgPicture.asset(
                          Assets.call,
                          height: 25,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height.height * 0.05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopUpWidget extends StatefulWidget {
  const PopUpWidget({Key? key}) : super(key: key);

  @override
  State<PopUpWidget> createState() => _PopUpWidgetState();
}

class _PopUpWidgetState extends State<PopUpWidget> {
  late final appCubit = get<AppCubit>();

  late bool locale = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      bloc: appCubit,
      builder: (context, state) {
        return GestureDetector(
            onTap: () async {
              await showMenu(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                color: AppColors.primary,
                context: context,
                position: RelativeRect.fromLTRB(100, 0, 0, 0),
                items: [
                  PopupMenuItem(
                    child: TextButton(
                      child: Text(
                        'О нас',
                        style: Styles.popUpTextStyle,
                      ),
                      onPressed: () {
                        Navigation.router.pop();
                        Navigation.router.push(AboutUsRoute());
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: TextButton(
                      child: Text(
                        'Напишите нам',
                        style: Styles.popUpTextStyle,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  PopupMenuItem(
                    child: TextButton(
                      child: Text(
                        'Поделиться',
                        style: Styles.popUpTextStyle,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  PopupMenuItem(
                    child: TextButton(
                      child: Row(
                        children: [
                          Text(
                            !state.locale ? 'Русский' : 'Кыргызча',
                            style: Styles.popUpTextStyle,
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset(
                            !state.locale ? Assets.rusFlag : Assets.kgFlag,
                            height: 25,
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigation.router.pop();
                        appCubit.changeLocale(locale = !locale);
                      },
                    ),
                  ),
                ],
              );
            },
            child: SvgPicture.asset(Assets.settings));
      },
    );
  }
}
