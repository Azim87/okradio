// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:ok_radio_flutter/presentation/home/home.dart' as _i1;
import 'package:ok_radio_flutter/presentation/play/play_page.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    OkRadioHomeRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.OkRadioHomePage());
    },
    PlayRadioRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.PlayRadioPage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(OkRadioHomeRoute.name, path: '/'),
        _i3.RouteConfig(PlayRadioRoute.name, path: '/play-radio-page')
      ];
}

/// generated route for
/// [_i1.OkRadioHomePage]
class OkRadioHomeRoute extends _i3.PageRouteInfo<void> {
  const OkRadioHomeRoute() : super(OkRadioHomeRoute.name, path: '/');

  static const String name = 'OkRadioHomeRoute';
}

/// generated route for
/// [_i2.PlayRadioPage]
class PlayRadioRoute extends _i3.PageRouteInfo<void> {
  const PlayRadioRoute() : super(PlayRadioRoute.name, path: '/play-radio-page');

  static const String name = 'PlayRadioRoute';
}
