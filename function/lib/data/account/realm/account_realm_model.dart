import 'package:realm/realm.dart';

part 'account_realm_model.realm.dart';

@RealmModel()
class _AccountRealmModel {
  @PrimaryKey()
  late int accountId;

}