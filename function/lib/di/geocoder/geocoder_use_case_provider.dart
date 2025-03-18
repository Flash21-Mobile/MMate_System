import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/geocoder/geocoder_repository_provider.dart';
import 'package:function_system/domain/geocoder/geocoder_use_case.dart';

final getGeocoderUseCaseProvider = Provider<GetGeocoderUseCase>((ref) {
  final repository = ref.watch(geocoderRepositoryProvider);
  return GetGeocoderUseCase(repository);
});