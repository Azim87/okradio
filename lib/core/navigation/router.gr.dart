// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:ok_radio_flutter/presentation/home/home.dart' as _i1;
import 'package:ok_radio_flutter/presentation/message/message_page.dart' as _i3;
import 'package:ok_radio_flutter/presentation/play/play_page.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    OkRadioHomeRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.OkRadioHomePage());
    },
    PlayRadioRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.PlayRadioPage());
    },
    MessageRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.MessagePage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(OkRadioHomeRoute.name, path: '/'),
        _i4.RouteConfig(PlayRadioRoute.name, path: '/play-radio-page'),
        _i4.RouteConfig(MessageRoute.name, path: '/message-page')
      ];
}

/// generated route for
/// [_i1.OkRadioHomePage]
class OkRadioHomeRoute extends _i4.PageRouteInfo<void> {
  const OkRadioHomeRoute() : super(OkRadioHomeRoute.name, path: '/');

  static const String name = 'OkRadioHomeRoute';
}

/// generated route for
/// [_i2.PlayRadioPage]
class PlayRadioRoute extends _i4.PageRouteInfo<void> {
  const PlayRadioRoute() : super(PlayRadioRoute.name, path: '/play-radio-page');

  static const String name = 'PlayRadioRoute';
}

/// generated route for
/// [_i3.MessagePage]
class MessageRoute extends _i4.PageRouteInfo<void> {
  const MessageRoute() : super(MessageRoute.name, path: '/message-page');

  static const String name = 'MessageRoute';
}
