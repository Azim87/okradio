import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ok_radio_flutter/application/cubit/app_cubit.dart';
import 'package:ok_radio_flutter/core/di/inject.dart';
import 'package:ok_radio_flutter/core/navigation/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'cubit/app_state.dart';

class OkRadioApp extends StatelessWidget {
  OkRadioApp();

  final appCubit = get<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appCubit..getLocaleFromCache(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            locale: state.locale ? Locale('ru') : Locale('ky'),
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            title: 'Ok radio',
            theme:
                ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
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
