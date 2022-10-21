import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/programs.dart';

part 'archive_state.freezed.dart';

@freezed
class ArchiveState with _$ArchiveState {
  const factory ArchiveState({
    @Default(false) bool loading,
    @Default([]) List<Programs> programs,
    @Default(0) int id,
  }) = _ArchiveState;
}
