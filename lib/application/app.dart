import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ok_radio_flutter/application/cubit/app_cubit.dart';
import 'package:ok_radio_flutter/core/di/inject.dart';
import 'package:ok_radio_flutter/core/navigation/navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'cubit/app_state.dart';

class OkRadioApp extends StatelessWidget {
  OkRadioApp();

  final navigation = Navigation.router;
  final appCubit = get<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appCubit..getLocaleFromCache(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          debugPrint('local state from app: ${state.locale}');

          return MaterialApp.router(
            locale: state.locale ? Locale('ru') : Locale('ky'),
            routeInformationParser: navigation.defaultRouteParser(),
            routerDelegate: AutoRouterDelegate(navigation),
            debugShowCheckedModeBanner: false,
            title: 'Ok radio',
            theme: ThemeData.light(),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
