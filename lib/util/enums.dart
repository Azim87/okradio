import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ProgramsType {
  ashar,
  dd,
  kutmantan,
  syrmaek,
  nazar,
  appalarmektebi,
  barzaman,
  immunitet,
  sekretchastya,
  silaperemen,
}

// extension ProgramExt on ProgramsType {
//   Function() programs() {
//     switch (this) {
//       case ProgramsType.ashar:
//         return Strings.ashar;

//       case ProgramsType.nazar:
//         return Strings.nazar;

//       case ProgramsType.immunitet:
//         return Strings.immunitet;

//       case ProgramsType.appalarmektebi:
//         return Strings.apalarMektebi;

//       case ProgramsType.silaperemen:
//         return Strings.silaPeremen;

//       case ProgramsType.barzaman:
//         return Strings.barZaman;

//       case ProgramsType.sekretchastya:
//         return Strings.sekretSchastya;
//       case ProgramsType.kutmantan:
//         return Strings.kutmanTan;

//       case ProgramsType.syrmaek:
//         return Strings.syrmaek;

//       default:
//         return Strings.denDobryi;
//     }
//   }
// }

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
