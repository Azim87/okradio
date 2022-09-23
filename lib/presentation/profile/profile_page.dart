import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

import '../../util/assets.dart';
import '../../util/colors.dart';
import '../../util/styles.dart';
import '../widgets/popup_widget.dart';

class SocialMedia {
  SocialMedia({this.icon, this.label});
  final String? icon;
  final String? label;
}

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final _radioFmList = <String>[
      AppLocalizations.of(context)!.bishkek,
      AppLocalizations.of(context)!.ik,
      AppLocalizations.of(context)!.talas,
      AppLocalizations.of(context)!.toktogul,
      AppLocalizations.of(context)!.naryn,
      AppLocalizations.of(context)!.south_region,
    ];

    final _socialList = <SocialMedia>[
      SocialMedia(
        icon: Assets.email,
        label: 'info@okradio.kg',
      ),
      SocialMedia(
        icon: Assets.facebook,
        label: AppLocalizations.of(context)!.facebook,
      ),
      SocialMedia(
        icon: Assets.whatsapp,
        label: AppLocalizations.of(context)!.whatsapp,
      ),
      SocialMedia(
        icon: Assets.youtube,
        label: AppLocalizations.of(context)!.youtube,
      ),
      SocialMedia(
        icon: Assets.tiktok,
        label: AppLocalizations.of(context)!.tiktok,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.aboutUs,
                      style: Styles.defaultPageTitleStyle,
                    ),
                    PopUpWidget(),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 2,
                  color: Color(0xFFD9D9D9),
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 16),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {},
                    leading: SvgPicture.asset(_socialList[index].icon!),
                    title: Text(
                      _socialList[index].label!,
                      style: Styles.socialMediaTextStyle,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  separatorBuilder: (context, i) => Container(
                    margin: const EdgeInsets.only(
                      left: 73,
                      right: 16,
                    ),
                    height: 1,
                    color: Color.fromARGB(255, 240, 240, 240),
                  ),
                  itemCount: _socialList.length,
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Радио',
                    style: Styles.defaultPageTitleStyle,
                  ),
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 16),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      _radioFmList[index],
                      style: Styles.socialMediaTextStyle,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  separatorBuilder: (context, i) => Container(
                    margin: const EdgeInsets.only(right: 16),
                    height: 1,
                    color: Color.fromARGB(255, 240, 240, 240),
                  ),
                  itemCount: _radioFmList.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
