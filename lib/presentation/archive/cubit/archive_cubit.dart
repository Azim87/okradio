import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '/repository/archive_repsoitory.dart';

import 'archive_state.dart';

@lazySingleton
class ArchiveCubit extends Cubit<ArchiveState> {
  ArchiveCubit(this.repository) : super(ArchiveState());

  final ArchiveRepository repository;

  void getArchives() async {
    final archives = await repository.getArchives();
    emit(state.copyWith(archives: archives));
  }
}
