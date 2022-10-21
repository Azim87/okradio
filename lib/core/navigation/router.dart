import 'package:auto_route/annotations.dart';
import 'package:ok_radio_flutter/presentation/archive/archive_details/archive_derails_page.dart';
import 'package:ok_radio_flutter/presentation/program/program_page.dart';
import 'package:ok_radio_flutter/presentation/share/share_page.dart';

import '/presentation/about/about_us.dart';
import '/presentation/home/home.dart';
import '/presentation/message/message_page.dart';
import '/presentation/play/play_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: OkRadioHomePage, initial: true),
    AutoRoute(page: PlayRadioPage),
    AutoRoute(page: MessagePage),
    AutoRoute(page: ProgramsPage),
    AutoRoute(page: AboutUsPage),
    AutoRoute(page: SharePage),
    AutoRoute(page: ArchiveDetailsPage)
  ],
)
class $AppRouter {}
