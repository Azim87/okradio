// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:ok_radio_flutter/presentation/about/about_us.dart' as _i4;
import 'package:ok_radio_flutter/presentation/home/home.dart' as _i1;
import 'package:ok_radio_flutter/presentation/message/message_page.dart' as _i3;
import 'package:ok_radio_flutter/presentation/play/play_page.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    OkRadioHomeRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.OkRadioHomePage());
    },
    PlayRadioRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.PlayRadioPage());
    },
    MessageRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.MessagePage());
    },
    AboutUsRoute.name: (routeData) {
      final args = routeData.argsAs<AboutUsRouteArgs>(
          orElse: () => const AboutUsRouteArgs());
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: _i4.AboutUsPage(key: args.key));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(OkRadioHomeRoute.name, path: '/'),
        _i5.RouteConfig(PlayRadioRoute.name, path: '/play-radio-page'),
        _i5.RouteConfig(MessageRoute.name, path: '/message-page'),
        _i5.RouteConfig(AboutUsRoute.name, path: '/about-us-page')
      ];
}

/// generated route for
/// [_i1.OkRadioHomePage]
class OkRadioHomeRoute extends _i5.PageRouteInfo<void> {
  const OkRadioHomeRoute() : super(OkRadioHomeRoute.name, path: '/');

  static const String name = 'OkRadioHomeRoute';
}

/// generated route for
/// [_i2.PlayRadioPage]
class PlayRadioRoute extends _i5.PageRouteInfo<void> {
  const PlayRadioRoute() : super(PlayRadioRoute.name, path: '/play-radio-page');

  static const String name = 'PlayRadioRoute';
}

/// generated route for
/// [_i3.MessagePage]
class MessageRoute extends _i5.PageRouteInfo<void> {
  const MessageRoute() : super(MessageRoute.name, path: '/message-page');

  static const String name = 'MessageRoute';
}

/// generated route for
/// [_i4.AboutUsPage]
class AboutUsRoute extends _i5.PageRouteInfo<AboutUsRouteArgs> {
  AboutUsRoute({_i6.Key? key})
      : super(AboutUsRoute.name,
            path: '/about-us-page', args: AboutUsRouteArgs(key: key));

  static const String name = 'AboutUsRoute';
}

class AboutUsRouteArgs {
  const AboutUsRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'AboutUsRouteArgs{key: $key}';
  }
}
