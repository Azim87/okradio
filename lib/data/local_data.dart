import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import 'package:ok_radio_flutter/model/archive.dart';

@lazySingleton
class LocalData {
  LocalData();

  final box = Hive.box<Archive>('personList');

  Future<void> clearCache() async {
    await box.clear();
  }

  Future<List<Archive>> getArchives() async {
    return box.toMap().values.toList().cast();
  }

  Future<void> addArchives(List<Archive> archive) async {
    box.addAll(archive);
  }
}
