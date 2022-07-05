import 'package:auto_route/annotations.dart';

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
    AutoRoute(page: AboutUsPage),
  ],
)
class $AppRouter {}
