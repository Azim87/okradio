import 'package:auto_route/annotations.dart';
import 'package:ok_radio_flutter/presentation/home/home.dart';
import 'package:ok_radio_flutter/presentation/play/play_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: OkRadioHomePage, initial: true),
    AutoRoute(page: PlayRadioPage)
  ],
)
class $AppRouter {}
