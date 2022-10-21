import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '/repository/archive_repsoitory.dart';

import 'archive_state.dart';

@lazySingleton
class ArchiveCubit extends Cubit<ArchiveState> {
  ArchiveCubit(this.repository) : super(ArchiveState());

  final ArchiveRepository repository;

  Future<void> getPrograms() async {
    final programs = await repository.getPrograms();

    emit(state.copyWith.call(programs: programs));
  }
}
