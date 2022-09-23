import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ok_radio_flutter/model/archive.dart';

import '/repository/archive_repsoitory.dart';

import 'archive_state.dart';

@lazySingleton
class ArchiveCubit extends Cubit<ArchiveState> {
  ArchiveCubit(this.repository) : super(ArchiveState());

  final ArchiveRepository repository;

  Future<void> getArchives() async {
    if (state.archives.isEmpty) {
      emit(state.copyWith(loading: true));

      await fetchArchives();
    } else if (state.archives != state.oldArchives) {
      await fetchArchives();
    } else {
      return;
    }
  }

  Future<void> fetchArchives() async {
    final archives = await repository
        .getArchives()
        .whenComplete(() => emit(state.copyWith(loading: false)));

    emit(state.copyWith.call(archives: archives));
  }

  void oldArchiveFromUi(List<Archive> oldArchive) {
    emit(state.copyWith.call(oldArchives: oldArchive));
  }
}
