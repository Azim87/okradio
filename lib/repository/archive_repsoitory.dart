import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ok_radio_flutter/core/newtork/network_checker.dart';
import 'package:ok_radio_flutter/data/local_data.dart';
import 'package:ok_radio_flutter/model/archive.dart';
import 'package:ok_radio_flutter/model/programs.dart';

import '../core/newtork/api.dart';

@lazySingleton
class ArchiveRepository {
  ArchiveRepository(
    this.api,
    this.localData,
    this.network,
  );

  final Api api;
  final LocalData localData;
  final NetworkChecker network;

  Future<List<Programs>> getPrograms() async {
    if (await network.isConnected) {
      final response = await api.getPrograms();

      var utf8Body = utf8.decode(response.bodyBytes);

      final List<Programs> programList = json
          .decode(utf8Body)
          .map<Programs>((value) => Programs.fromJson(value))
          .toList();

      localData.addPrograms(programList);

      return programList;
    }
    return localData.getPrograms();
  }

  Future<List<Archive>> getArchives({required int id}) async {
    if (await network.isConnected) {
      final response = await api.getProgramArchives(id);

      var utf8Body = utf8.decode(response.bodyBytes);
      debugPrint('----------------------------------:$utf8Body');

      if (utf8Body.isEmpty) {
        return [];
      } else {
        final List<Archive> archiveList = json
            .decode(utf8Body)
            ?.map<Archive>((value) => Archive.fromJson(value))
            .toList();

        localData.clearCache();

        localData.addArchives(archiveList);

        return archiveList;
      }
    }
    return localData.getArchives();
  }
}
