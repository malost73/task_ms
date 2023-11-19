// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_db.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class WeatherDB extends $WeatherDB
    with RealmEntity, RealmObjectBase, RealmObject {
  WeatherDB(
    int id, {
    String? main,
    String? description,
    String? icon,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'main', main);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'icon', icon);
  }

  WeatherDB._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get main => RealmObjectBase.get<String>(this, 'main') as String?;
  @override
  set main(String? value) => RealmObjectBase.set(this, 'main', value);

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  String? get icon => RealmObjectBase.get<String>(this, 'icon') as String?;
  @override
  set icon(String? value) => RealmObjectBase.set(this, 'icon', value);

  @override
  Stream<RealmObjectChanges<WeatherDB>> get changes =>
      RealmObjectBase.getChanges<WeatherDB>(this);

  @override
  WeatherDB freeze() => RealmObjectBase.freezeObject<WeatherDB>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(WeatherDB._);
    return const SchemaObject(ObjectType.realmObject, WeatherDB, 'WeatherDB', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('main', RealmPropertyType.string, optional: true),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('icon', RealmPropertyType.string, optional: true),
    ]);
  }
}
