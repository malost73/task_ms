// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_name_db.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CityNameDB extends $CityNameDB
    with RealmEntity, RealmObjectBase, RealmObject {
  CityNameDB(
    ObjectId id, {
    String? name,
    LocalCityNamesDB? localNames,
    double? lat,
    double? lon,
    String? country,
    String? state,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'localNames', localNames);
    RealmObjectBase.set(this, 'lat', lat);
    RealmObjectBase.set(this, 'lon', lon);
    RealmObjectBase.set(this, 'country', country);
    RealmObjectBase.set(this, 'state', state);
  }

  CityNameDB._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  LocalCityNamesDB? get localNames =>
      RealmObjectBase.get<LocalCityNamesDB>(this, 'localNames')
          as LocalCityNamesDB?;
  @override
  set localNames(covariant LocalCityNamesDB? value) =>
      RealmObjectBase.set(this, 'localNames', value);

  @override
  double? get lat => RealmObjectBase.get<double>(this, 'lat') as double?;
  @override
  set lat(double? value) => RealmObjectBase.set(this, 'lat', value);

  @override
  double? get lon => RealmObjectBase.get<double>(this, 'lon') as double?;
  @override
  set lon(double? value) => RealmObjectBase.set(this, 'lon', value);

  @override
  String? get country =>
      RealmObjectBase.get<String>(this, 'country') as String?;
  @override
  set country(String? value) => RealmObjectBase.set(this, 'country', value);

  @override
  String? get state => RealmObjectBase.get<String>(this, 'state') as String?;
  @override
  set state(String? value) => RealmObjectBase.set(this, 'state', value);

  @override
  Stream<RealmObjectChanges<CityNameDB>> get changes =>
      RealmObjectBase.getChanges<CityNameDB>(this);

  @override
  CityNameDB freeze() => RealmObjectBase.freezeObject<CityNameDB>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CityNameDB._);
    return const SchemaObject(
        ObjectType.realmObject, CityNameDB, 'CityNameDB', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('localNames', RealmPropertyType.object,
          optional: true, linkTarget: 'LocalCityNamesDB'),
      SchemaProperty('lat', RealmPropertyType.double, optional: true),
      SchemaProperty('lon', RealmPropertyType.double, optional: true),
      SchemaProperty('country', RealmPropertyType.string, optional: true),
      SchemaProperty('state', RealmPropertyType.string, optional: true),
    ]);
  }
}
