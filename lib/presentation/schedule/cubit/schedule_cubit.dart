import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ok_radio_flutter/util/enums.dart';

import '../../../model/schedule.dart';

part 'schedule_state.dart';
part 'schedule_cubit.freezed.dart';

@injectable
class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit()
      : super(ScheduleState(scheduleList: Schedule.scheduleMonday()));

  void onDayChange(DayType dayType) {
    switch (dayType) {
      case DayType.Monday:
        emit(state.copyWith(scheduleList: Schedule.scheduleMonday()));
        break;
      case DayType.Tuesday:
        emit(state.copyWith(scheduleList: Schedule.scheduleTuesday()));
        break;
      case DayType.Wednesday:
        emit(state.copyWith(scheduleList: Schedule.scheduleWednesday()));
        break;
      case DayType.Thursday:
        emit(state.copyWith(scheduleList: Schedule.scheduleThursday()));
        break;
      case DayType.Friday:
        emit(state.copyWith(scheduleList: Schedule.scheduleFriday()));
        break;
      case DayType.Saturday:
        emit(state.copyWith(scheduleList: Schedule.scheduleSaturday()));
        break;
      default:
        emit(state.copyWith(scheduleList: Schedule.scheduleSunday()));
    }
  }
}
