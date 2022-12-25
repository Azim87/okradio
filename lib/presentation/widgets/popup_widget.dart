import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../application/cubit/app_cubit.dart';
import '../../application/cubit/app_state.dart';
import '../../core/di/inject.dart';
import '../../core/navigation/navigation.dart';
import '../../core/navigation/router.gr.dart';
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
                        AppLocalizations.of(context)!.aboutUs,
                        style: Styles.popUpTextStyle,
                      ),
                      onPressed: () {
                        Navigation.router.pop();
                        Navigation.router.push(AboutUsRoute());
                      },
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
                    child: TextButton(
                      child: Text(
                        AppLocalizations.of(context)!.share,
                        style: Styles.popUpTextStyle,
                      ),
                      onPressed: () {
                        Navigation.router.pop();
                        Navigation.router.push(ShareRoute());
                      },
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
