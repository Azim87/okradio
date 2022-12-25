import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';
import '/core/di/inject.dart';
import '/presentation/widgets/socal_network_functions.dart';
import '/util/assets.dart';

import '../../core/navigation/navigation.dart';
import '../../util/colors.dart';
import '../../util/styles.dart';
import '../widgets/popup_widget.dart';

import 'dart:io' show Platform;

class SharePage extends StatelessWidget {
  SharePage({super.key});

  final socialNetwork = get.get<SocialNetworkFucntion>();

  // Future<void> _sendEmail() async {
  //   final mailtoLink = Mailto(
  //     to: [Strings.emailTo],
  //     subject: "from",
  //   );

  //   await launchUrl(Uri.parse('$mailtoLink'));
  // }

  // Future<void> _openFacebook() async {
  //   final Uri _urr = Uri.parse(Strings.facebook);

  //   if (await launchUrl(_urr)) {
  //     await canLaunchUrl(_urr);
  //   } else {
  //     throw 'There was a problem to open the url: $_urr';
  //   }
  // }

  // Future<void> _openTiktok() async {
  //   final Uri _urr = Uri.parse(Strings.tiktok);

  //   if (await launchUrl(_urr)) {
  //     await canLaunchUrl(_urr);
  //   } else {
  //     throw 'There was a problem to open the url: $_urr';
  //   }
  // }

  // Future<void> _openYoutube() async {
  //   final Uri _urr = Uri.parse(Strings.youtube);

  //   if (await launchUrl(_urr)) {
  //     await canLaunchUrl(_urr);
  //   } else {
  //     throw 'There was a problem to open the url: $_urr';
  //   }
  // }

  // Future<void> _openWhatsapp() async {
  //   final Uri _urr = Uri.parse(Strings.whatsapp);

  //   if (await launchUrl(_urr)) {
  //     await canLaunchUrl(_urr);
  //   } else {
  //     throw 'There was a problem to open the url: $_urr';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/anim/patterns.png'))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigation.router.pop(),
                      icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                  Text(
                    AppLocalizations.of(context)!.share,
                    style: Styles.defaultPageTitleStyle,
                  ),
                  PopUpWidget(),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                height: 2,
                color: Color(0xFFD9D9D9),
              ),
              const Spacer(),
              _buildSocialMediaShareContainer(context),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildSocialMediaShareContainer(BuildContext context) => Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: AppColors.primary,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              AppLocalizations.of(context)!.shareWith,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          subtitle: InkWell(
            onTap: () {
              if (Platform.isAndroid)
                Share.share(
                    'https://play.google.com/store/apps/details?id=kgz.okradio&hl=ru&gl=US');
              if (Platform.isIOS) Share.share('');
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Platform.isAndroid
                      ? AssetImage(Assets.playmarket)
                      : AssetImage(Assets.appstore),
                ),
              ),
            ),
          ),
          // subtitle: Padding(
          //   padding: const EdgeInsets.only(bottom: 25),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       InkWell(
          //         onTap: () async => socialNetwork.sendEmail(),
          //         child: SvgPicture.asset(
          //           Assets.email,
          //           height: 50,
          //         ),
          //       ),
          //       InkWell(
          //         onTap: () => socialNetwork.openFacebook(),
          //         child: SvgPicture.asset(
          //           Assets.facebook,
          //           height: 50,
          //         ),
          //       ),
          //       InkWell(
          //         onTap: () => socialNetwork.openTiktok(),
          //         child: SvgPicture.asset(
          //           Assets.tiktok,
          //           height: 50,
          //         ),
          //       ),
          //       InkWell(
          //         onTap: () => socialNetwork.openYoutube(),
          //         child: SvgPicture.asset(
          //           Assets.youtube,
          //           height: 50,
          //         ),
          //       ),
          //       InkWell(
          //         onTap: () => socialNetwork.openWhatsapp(),
          //         child: SvgPicture.asset(
          //           Assets.whatsapp,
          //           height: 50,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      );
}
