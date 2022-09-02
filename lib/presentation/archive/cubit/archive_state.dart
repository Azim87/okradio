import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/archive.dart';

part 'archive_state.freezed.dart';

@freezed
class ArchiveState with _$ArchiveState {
  const factory ArchiveState({
    int? id,
    @Default([]) List<Archive> archives,
  }) = _ArchiveState;
}
