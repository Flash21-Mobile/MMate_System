import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/qr/repository/qr_repository.dart';
import '../../data/qr/repository/qr_repository_impl.dart';
import '../utilities/dio_provider.dart';

final qrRepositoryProvider = Provider<QrRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return QrRepositoryImpl(dio);
});