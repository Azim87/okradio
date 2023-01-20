import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:ok_radio_flutter/model/archive.dart';
import 'package:ok_radio_flutter/repository/archive_repsoitory.dart';

import 'archive_details_state.dart';

@injectable
class ArchiveDetailsCubit extends Cubit<ArchiveDetailsState> {
  ArchiveDetailsCubit(this.repository) : super(ArchiveDetailsState());

  final ArchiveRepository repository;

  Future<void> fetchProgramArchives(int id) async {
    final archvie = await repository.getArchives(id: id);

    debugPrint('________________$archvie');

    if (archvie.contains('Error')) {
      emit(state.copyWith.call(archive: [
        Archive(
          title: '',
          id: 0,
          dateTime: null,
          image: '',
          audioId: 0,
          content: '',
        )
      ]));
    }

    emit(state.copyWith.call(archive: archvie));
  }
}
