part of 'schedule_cubit.dart';

@freezed
class ScheduleState with _$ScheduleState {
  const factory ScheduleState({
    List<Schedule>? scheduleList,
  }) = _ScheduleState;
}
