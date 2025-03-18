import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/login/service/login_service.dart';

import '../utilities/dio_provider.dart';

final loginServiceProvider = Provider<LoginService>((ref) {
  final dio = ref.watch(dioProvider);
  return LoginService(dio);
});
