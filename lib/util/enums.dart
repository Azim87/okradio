import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum DayType {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}

extension DayTypeExt on DayType {
  String days(BuildContext context) {
    switch (this) {
      case DayType.Monday:
        return AppLocalizations.of(context)!.ponedelnik;

      case DayType.Tuesday:
        return AppLocalizations.of(context)!.vtornik;

      case DayType.Wednesday:
        return AppLocalizations.of(context)!.sreda;

      case DayType.Thursday:
        return AppLocalizations.of(context)!.chetverg;

      case DayType.Friday:
        return AppLocalizations.of(context)!.pyatnitsa;

      case DayType.Saturday:
        return AppLocalizations.of(context)!.subota;

      case DayType.Sunday:
        return AppLocalizations.of(context)!.voskresenie;
    }
  }
}
