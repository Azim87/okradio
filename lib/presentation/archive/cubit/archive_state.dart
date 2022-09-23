import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/archive.dart';

part 'archive_state.freezed.dart';

@freezed
class ArchiveState with _$ArchiveState {
  const factory ArchiveState({
    @Default(false) bool loading,
    @Default([]) List<Archive> archives,
    @Default([]) List<Archive> oldArchives,
  }) = _ArchiveState;
}
