import 'dart:io';
import 'dart:typed_data';

abstract class SharedRepository {
  Future<Uint8List> saveUint(Uint8List bytes, String prefKey);

  Future<Uint8List> loadUint(String prefKey);

  Future<File> saveFile(File file);

  Future<File> loadFile();
}
