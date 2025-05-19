// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class AccountRealmModel extends _AccountRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  AccountRealmModel(
    int accountId,
  ) {
    RealmObjectBase.set(this, 'accountId', accountId);
  }

  AccountRealmModel._();

  @override
  int get accountId => RealmObjectBase.get<int>(this, 'accountId') as int;
  @override
  set accountId(int value) => RealmObjectBase.set(this, 'accountId', value);

  @override
  Stream<RealmObjectChanges<AccountRealmModel>> get changes =>
      RealmObjectBase.getChanges<AccountRealmModel>(this);

  @override
  Stream<RealmObjectChanges<AccountRealmModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<AccountRealmModel>(this, keyPaths);

  @override
  AccountRealmModel freeze() =>
      RealmObjectBase.freezeObject<AccountRealmModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'accountId': accountId.toEJson(),
    };
  }

  static EJsonValue _toEJson(AccountRealmModel value) => value.toEJson();
  static AccountRealmModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'accountId': EJsonValue accountId,
      } =>
        AccountRealmModel(
          fromEJson(accountId),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(AccountRealmModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, AccountRealmModel, 'AccountRealmModel', [
      SchemaProperty('accountId', RealmPropertyType.int, primaryKey: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
