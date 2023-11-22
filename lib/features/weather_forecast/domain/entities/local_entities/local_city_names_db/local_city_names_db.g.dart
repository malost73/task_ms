// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_city_names_db.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class LocalCityNamesDB extends $LocalCityNamesDB
    with RealmEntity, RealmObjectBase, RealmObject {
  LocalCityNamesDB(
    ObjectId id, {
    String? ru,
    String? en,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'ru', ru);
    RealmObjectBase.set(this, 'en', en);
  }

  LocalCityNamesDB._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get ru => RealmObjectBase.get<String>(this, 'ru') as String?;
  @override
  set ru(String? value) => RealmObjectBase.set(this, 'ru', value);

  @override
  String? get en => RealmObjectBase.get<String>(this, 'en') as String?;
  @override
  set en(String? value) => RealmObjectBase.set(this, 'en', value);

  @override
  Stream<RealmObjectChanges<LocalCityNamesDB>> get changes =>
      RealmObjectBase.getChanges<LocalCityNamesDB>(this);

  @override
  LocalCityNamesDB freeze() =>
      RealmObjectBase.freezeObject<LocalCityNamesDB>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(LocalCityNamesDB._);
    return const SchemaObject(
        ObjectType.realmObject, LocalCityNamesDB, 'LocalCityNamesDB', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('ru', RealmPropertyType.string, optional: true),
      SchemaProperty('en', RealmPropertyType.string, optional: true),
    ]);
  }
}
