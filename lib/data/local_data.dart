import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import 'package:ok_radio_flutter/model/archive.dart';
import 'package:ok_radio_flutter/model/programs.dart';

@lazySingleton
class LocalData {
  LocalData();

  final programBox = Hive.box<Programs>('programBox');
  final archiveBox = Hive.box<Archive>('archiveBox');

  Future<void> clearCache() async {
    await archiveBox.clear();
    await programBox.clear();
  }

  Future<List<Archive>> getArchives() async {
    return archiveBox.toMap().values.toList().cast();
  }

  Future<void> addArchives(List<Archive> archive) async {
    archiveBox.addAll(archive);
  }

  Future<List<Programs>> getPrograms() async {
    return programBox.toMap().values.toList().cast();
  }

  Future<void> addPrograms(List<Programs> archive) async {
    programBox.addAll(archive);
  }
}
