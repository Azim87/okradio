// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:ok_radio_flutter/presentation/about/about_us.dart' as _i5;
import 'package:ok_radio_flutter/presentation/home/home.dart' as _i1;
import 'package:ok_radio_flutter/presentation/message/message_page.dart' as _i3;
import 'package:ok_radio_flutter/presentation/play/play_page.dart' as _i2;
import 'package:ok_radio_flutter/presentation/program/program_page.dart' as _i4;
import 'package:ok_radio_flutter/presentation/share/share_page.dart' as _i6;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    OkRadioHomeRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.OkRadioHomePage());
    },
    PlayRadioRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.PlayRadioPage());
    },
    MessageRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.MessagePage());
    },
    ProgramsRoute.name: (routeData) {
      final args = routeData.argsAs<ProgramsRouteArgs>(
          orElse: () => const ProgramsRouteArgs());
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: _i4.ProgramsPage(key: args.key));
    },
    AboutUsRoute.name: (routeData) {
      final args = routeData.argsAs<AboutUsRouteArgs>(
          orElse: () => const AboutUsRouteArgs());
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: _i5.AboutUsPage(key: args.key));
    },
    ShareRoute.name: (routeData) {
      final args = routeData.argsAs<ShareRouteArgs>(
          orElse: () => const ShareRouteArgs());
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: _i6.SharePage(key: args.key));
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(OkRadioHomeRoute.name, path: '/'),
        _i7.RouteConfig(PlayRadioRoute.name, path: '/play-radio-page'),
        _i7.RouteConfig(MessageRoute.name, path: '/message-page'),
        _i7.RouteConfig(ProgramsRoute.name, path: '/programs-page'),
        _i7.RouteConfig(AboutUsRoute.name, path: '/about-us-page'),
        _i7.RouteConfig(ShareRoute.name, path: '/share-page')
      ];
}

/// generated route for
/// [_i1.OkRadioHomePage]
class OkRadioHomeRoute extends _i7.PageRouteInfo<void> {
  const OkRadioHomeRoute() : super(OkRadioHomeRoute.name, path: '/');

  static const String name = 'OkRadioHomeRoute';
}

/// generated route for
/// [_i2.PlayRadioPage]
class PlayRadioRoute extends _i7.PageRouteInfo<void> {
  const PlayRadioRoute() : super(PlayRadioRoute.name, path: '/play-radio-page');

  static const String name = 'PlayRadioRoute';
}

/// generated route for
/// [_i3.MessagePage]
class MessageRoute extends _i7.PageRouteInfo<void> {
  const MessageRoute() : super(MessageRoute.name, path: '/message-page');

  static const String name = 'MessageRoute';
}

/// generated route for
/// [_i4.ProgramsPage]
class ProgramsRoute extends _i7.PageRouteInfo<ProgramsRouteArgs> {
  ProgramsRoute({_i8.Key? key})
      : super(ProgramsRoute.name,
            path: '/programs-page', args: ProgramsRouteArgs(key: key));

  static const String name = 'ProgramsRoute';
}

class ProgramsRouteArgs {
  const ProgramsRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'ProgramsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.AboutUsPage]
class AboutUsRoute extends _i7.PageRouteInfo<AboutUsRouteArgs> {
  AboutUsRoute({_i8.Key? key})
      : super(AboutUsRoute.name,
            path: '/about-us-page', args: AboutUsRouteArgs(key: key));

  static const String name = 'AboutUsRoute';
}

class AboutUsRouteArgs {
  const AboutUsRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'AboutUsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.SharePage]
class ShareRoute extends _i7.PageRouteInfo<ShareRouteArgs> {
  ShareRoute({_i8.Key? key})
      : super(ShareRoute.name,
            path: '/share-page', args: ShareRouteArgs(key: key));

  static const String name = 'ShareRoute';
}

class ShareRouteArgs {
  const ShareRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'ShareRouteArgs{key: $key}';
  }
}
