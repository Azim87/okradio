import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../model/archive.dart';

part 'archive_details_state.freezed.dart';

@freezed
class ArchiveDetailsState with _$ArchiveDetailsState {
  const factory ArchiveDetailsState({
    final int? id,
    @Default([]) final List<Archive> archive,
  }) = _ArchiveDetailsState;
}
