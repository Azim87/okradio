import 'package:injectable/injectable.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../util/constants.dart';

@singleton
class SocialNetworkFucntion {
  Future<void> sendEmail() async {
    final mailtoLink = Mailto(
      to: [Strings.emailTo],
      subject: "from",
    );

    await launchUrl(Uri.parse('$mailtoLink'));
  }

  Future<void> openFacebook() async {
    final Uri _urr = Uri.parse(Strings.facebook);

    if (await launchUrl(_urr)) {
      await canLaunchUrl(_urr);
    } else {
      throw 'There was a problem to open the url: $_urr';
    }
  }

  Future<void> openTiktok() async {
    final Uri _urr = Uri.parse(Strings.tiktok);

    if (await launchUrl(_urr)) {
      await canLaunchUrl(_urr);
    } else {
      throw 'There was a problem to open the url: $_urr';
    }
  }

  Future<void> openYoutube() async {
    final Uri _urr = Uri.parse(Strings.youtube);

    if (await launchUrl(_urr)) {
      await canLaunchUrl(_urr);
    } else {
      throw 'There was a problem to open the url: $_urr';
    }
  }

  Future<void> openWhatsapp() async {
    final Uri _urr = Uri.parse(Strings.whatsapp);

    if (await launchUrl(_urr)) {
      await canLaunchUrl(_urr);
    } else {
      throw 'There was a problem to open the url: $_urr';
    }
  }
}
