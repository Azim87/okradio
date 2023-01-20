import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ok_radio_flutter/presentation/home/home.dart';

import '../../presentation/about/about_us.dart';
import '../../presentation/archive/archive_details/archive_derails_page.dart';
import '../../presentation/program/program_page.dart';
import '../../presentation/share/share_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          final MediaQueryData data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(
                boldText: false,
                textScaleFactor:
                    data.textScaleFactor > 1.0 ? 1.0 : data.textScaleFactor),
            child: OkRadioHomePage(),
          );
        },
        routes: [
          GoRoute(
            path: 'about',
            name: 'about',
            builder: (BuildContext context, GoRouterState state) {
              final MediaQueryData data = MediaQuery.of(context);
              return MediaQuery(
                  data: data.copyWith(
                      boldText: false,
                      textScaleFactor: data.textScaleFactor > 1.0
                          ? 1.0
                          : data.textScaleFactor),
                  child: AboutUsPage());
            },
          ),
          GoRoute(
            path: 'share',
            name: 'share',
            builder: (BuildContext context, GoRouterState state) {
              final MediaQueryData data = MediaQuery.of(context);
              return MediaQuery(
                  data: data.copyWith(
                      boldText: false,
                      textScaleFactor: data.textScaleFactor > 1.0
                          ? 1.0
                          : data.textScaleFactor),
                  child: SharePage());
            },
          ),
          GoRoute(
            path: 'programs',
            builder: (BuildContext context, GoRouterState state) {
              final MediaQueryData data = MediaQuery.of(context);
              return MediaQuery(
                  data: data.copyWith(
                      boldText: false,
                      textScaleFactor: data.textScaleFactor > 1.0
                          ? 1.0
                          : data.textScaleFactor),
                  child: ProgramsPage());
            },
          ),
          GoRoute(
            path: 'archive_detail/:id/:title/:index',
            name: 'archive_detail',
            builder: (BuildContext context, GoRouterState state) {
              final MediaQueryData data = MediaQuery.of(context);
              return MediaQuery(
                data: data.copyWith(
                    boldText: false,
                    textScaleFactor: data.textScaleFactor > 1.0
                        ? 1.0
                        : data.textScaleFactor),
                child: ArchiveDetailsPage(
                  id: state.params['id']!,
                  title: state.params['title']!,
                  index: int.parse(state.params['index']!),
                ),
              );
            },
          ),
        ]),
  ],
);
