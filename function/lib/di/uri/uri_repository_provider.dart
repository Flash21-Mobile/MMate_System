import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/uri/repository/uri_repository.dart';
import 'package:function_system/data/uri/repository/uri_repository_impl.dart';

final uriRepositoryProvider = Provider<UriRepository>((ref) {
  return UriRepositoryImpl();
});