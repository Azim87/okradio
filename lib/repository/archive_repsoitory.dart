import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:ok_radio_flutter/core/newtork/network_checker.dart';
import 'package:ok_radio_flutter/data/local_data.dart';
import 'package:ok_radio_flutter/model/archive.dart';

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

  Future<List<Archive>> getArchives() async {
    if (await network.isConnected) {
      final response = await api.getArchives();

      var utf8Body = utf8.decode(response.bodyBytes);

      final List<Archive> archiveList = json
          .decode(utf8Body)
          .map<Archive>((value) => Archive.fromJson(value))
          .toList();

      localData.addArchives(archiveList);

      return archiveList;
    }
    return localData.getArchives();
  }
}
