import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mailto/mailto.dart';
import 'package:ok_radio_flutter/util/assets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/navigation/navigation.dart';
import '../../util/colors.dart';
import '../../util/styles.dart';
import '../widgets/popup_widget.dart';

class SharePage extends StatelessWidget {
  SharePage({super.key});

  Future<void> _sendEmail() async {
    final mailtoLink = Mailto(
      to: ['info@okradio.kg'],
      subject: "from",
    );

    await launchUrl(Uri.parse('$mailtoLink'));
  }

  Future<void> _openFacebook() async {
    final Uri _urr =
        Uri.parse('https://www.facebook.com/profile.php?id=100063701852938');

    if (await launchUrl(_urr)) {
      await canLaunchUrl(_urr);
    } else {
      throw 'There was a problem to open the url: $_urr';
    }
  }

  Future<void> _openTiktok() async {
    final Uri _urr = Uri.parse('https://www.tiktok.com/@okradio.kg');

    if (await launchUrl(_urr)) {
      await canLaunchUrl(_urr);
    } else {
      throw 'There was a problem to open the url: $_urr';
    }
  }

  Future<void> _openYoutube() async {
    final Uri _urr =
        Uri.parse('https://www.youtube.com/channel/UCRCRqpeFq_1Cu3O5xiyuizw');

    if (await launchUrl(_urr)) {
      await canLaunchUrl(_urr);
    } else {
      throw 'There was a problem to open the url: $_urr';
    }
  }

  Future<void> _openWhatsapp() async {
    final Uri _urr = Uri.parse(
        'whatsapp://send?phone=996705531664&text&type=phone_number&app_absent=0');

    if (await launchUrl(_urr)) {
      await canLaunchUrl(_urr);
    } else {
      throw 'There was a problem to open the url: $_urr';
    }
  }

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
            padding: const EdgeInsets.symmetric(vertical: 25),
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
          subtitle: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async => _sendEmail(),
                  child: SvgPicture.asset(
                    Assets.email,
                    height: 50,
                  ),
                ),
                InkWell(
                  onTap: () => _openFacebook(),
                  child: SvgPicture.asset(
                    Assets.facebook,
                    height: 50,
                  ),
                ),
                InkWell(
                  onTap: () => _openTiktok(),
                  child: SvgPicture.asset(
                    Assets.tiktok,
                    height: 50,
                  ),
                ),
                InkWell(
                  onTap: () => _openYoutube(),
                  child: SvgPicture.asset(
                    Assets.youtube,
                    height: 50,
                  ),
                ),
                InkWell(
                  onTap: () => _openWhatsapp(),
                  child: SvgPicture.asset(
                    Assets.whatsapp,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
