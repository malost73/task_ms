// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_db.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CoordinatesDB extends $CoordinatesDB
    with RealmEntity, RealmObjectBase, RealmObject {
  CoordinatesDB(
    ObjectId id, {
    double? lon,
    double? lat,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'lon', lon);
    RealmObjectBase.set(this, 'lat', lat);
  }

  CoordinatesDB._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  double? get lon => RealmObjectBase.get<double>(this, 'lon') as double?;
  @override
  set lon(double? value) => RealmObjectBase.set(this, 'lon', value);

  @override
  double? get lat => RealmObjectBase.get<double>(this, 'lat') as double?;
  @override
  set lat(double? value) => RealmObjectBase.set(this, 'lat', value);

  @override
  Stream<RealmObjectChanges<CoordinatesDB>> get changes =>
      RealmObjectBase.getChanges<CoordinatesDB>(this);

  @override
  CoordinatesDB freeze() => RealmObjectBase.freezeObject<CoordinatesDB>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CoordinatesDB._);
    return const SchemaObject(
        ObjectType.realmObject, CoordinatesDB, 'CoordinatesDB', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('lon', RealmPropertyType.double, optional: true),
      SchemaProperty('lat', RealmPropertyType.double, optional: true),
    ]);
  }
}
