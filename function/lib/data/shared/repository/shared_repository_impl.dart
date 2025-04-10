import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:function_system/data/shared/repository/shared_repository.dart';
import 'package:function_system/key/constants_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../key/shared_preference_key.dart';
import '../../../utilities/exception/exceoption.dart';

class SharedRepositoryImpl extends SharedRepository {
  @override
  Future<Uint8List> saveUint(Uint8List bytes, String prefKey) async {
    final preferences = await SharedPreferences.getInstance();
    try {
      String base64String = base64Encode(bytes);
      await preferences.setString(prefKey, base64String);
      return bytes;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Uint8List> loadUint(String prefKey) async {
    final preferences = await SharedPreferences.getInstance();
    try {
      String? base64String = preferences.getString(prefKey);
      if (base64String == null) {
        throw MMateException.noFilesFound;
      }
      return base64Decode(base64String);

    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<File> saveFile(File file) async {
    final preferences = await SharedPreferences.getInstance();
    try {
      preferences.setString(PrefKey.card, file.path);
      return file;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<File> loadFile() async {
    final preferences = await SharedPreferences.getInstance();
    try {
      final filePath = preferences.getString(PrefKey.card);
      if (filePath == null) {
        throw MMateException.noFilesFound;
      }
      return File(filePath);
    } catch (e) {
      rethrow;
    }
  }
}
