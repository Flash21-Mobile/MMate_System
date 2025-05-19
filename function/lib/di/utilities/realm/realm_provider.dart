import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/account/realm/account_realm_model.dart';

part 'realm_provider.g.dart';

@Riverpod(keepAlive: true)
Realm realm(Ref ref) {
  final config = Configuration.local([
    AccountRealmModel.schema,
  ]);
  final realm = Realm(config);

  ref.onDispose(() {
    realm.close(); // 안전하게 닫기
  });

  return realm;
}
