import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:ok_radio_flutter/core/newtork/network_checker.dart';
import 'package:ok_radio_flutter/model/archive.dart';
import 'package:ok_radio_flutter/model/programs.dart';

import '../core/newtork/api.dart';

@lazySingleton
class ArchiveRepository {
  ArchiveRepository(
    this.api,
    this.network,
  );

  final Api api;

  final NetworkChecker network;

  Future<List<Programs>> getPrograms() async {
    final response = await api.getPrograms();

    var utf8Body = utf8.decode(response.bodyBytes);

    final List<Programs> programList = json
        .decode(utf8Body)
        .map<Programs>((value) => Programs.fromJson(value))
        .toList();

    return programList;
  }

  Future<List<Archive>> getArchives({required int id}) async {
    final response = await api.getProgramArchives(id);

    var utf8Body = utf8.decode(response.bodyBytes);

    if (utf8Body.contains('Error') || utf8Body.isEmpty) {
      return [Archive()];
    } else {
      final List<Archive> archiveList = json
          .decode(utf8Body)
          ?.map<Archive>((value) => Archive.fromJson(value))
          .toList();

      return archiveList;
    }
  }
}
