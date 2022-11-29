import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import 'package:ok_radio_flutter/model/programs.dart';

@lazySingleton
class LocalData {
  LocalData();

  final programBox = Hive.box<Programs>('programBox');

  Future<void> clearCache() async {
    await programBox.clear();
  }

  Future<List<Programs>> getPrograms() async {
    return programBox.toMap().values.toList().cast();
  }

  Future<void> addPrograms(List<Programs> archive) async {
    programBox.addAll(archive);
  }
}
