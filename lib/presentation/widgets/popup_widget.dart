import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../application/cubit/app_cubit.dart';
import '../../application/cubit/app_state.dart';
import '../../core/di/inject.dart';
import '../../util/assets.dart';
import '../../util/colors.dart';
import '../../util/styles.dart';

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
    final MediaQueryData data = MediaQuery.of(context);
    return MediaQuery(
      data: data.copyWith(
          boldText: false,
          textScaleFactor:
              data.textScaleFactor > 1.0 ? 1.0 : data.textScaleFactor),
      child: BlocBuilder<AppCubit, AppState>(
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
                      child: MediaQuery(
                        data: data.copyWith(
                            boldText: false,
                            textScaleFactor: data.textScaleFactor > 1.0
                                ? 1.0
                                : data.textScaleFactor),
                        child: TextButton(
                          child: Text(
                            AppLocalizations.of(context)!.aboutUs,
                            style: Styles.popUpTextStyle,
                          ),
                          onPressed: () {
                            context.pop();
                            context.goNamed('about');
                          },
                        ),
                      ),
                    ),
                    // PopupMenuItem(
                    //   child: TextButton(
                    //     child: Text(
                    //       AppLocalizations.of(context)!.connection,
                    //       style: Styles.popUpTextStyle,
                    //     ),
                    //     onPressed: () {},
                    //   ),
                    // ),
                    PopupMenuItem(
                      child: MediaQuery(
                        data: data.copyWith(
                            boldText: false,
                            textScaleFactor: data.textScaleFactor > 1.0
                                ? 1.0
                                : data.textScaleFactor),
                        child: TextButton(
                          child: Text(
                            AppLocalizations.of(context)!.share,
                            style: Styles.popUpTextStyle,
                          ),
                          onPressed: () {
                            context.pop();
                            context.goNamed('share');
                          },
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      child: MediaQuery(
                        data: data.copyWith(
                            boldText: false,
                            textScaleFactor: data.textScaleFactor > 1.0
                                ? 1.0
                                : data.textScaleFactor),
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
                            context.pop();
                            appCubit.changeLocale(locale = !locale);
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
              child: SvgPicture.asset(Assets.settings));
        },
      ),
    );
  }
}
