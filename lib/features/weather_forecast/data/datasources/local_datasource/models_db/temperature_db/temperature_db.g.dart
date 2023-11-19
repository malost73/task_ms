// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_db.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TemperatureDB extends $TemperatureDB
    with RealmEntity, RealmObjectBase, RealmObject {
  TemperatureDB(
    ObjectId id, {
    double? min,
    double? max,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'min', min);
    RealmObjectBase.set(this, 'max', max);
  }

  TemperatureDB._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  double? get min => RealmObjectBase.get<double>(this, 'min') as double?;
  @override
  set min(double? value) => RealmObjectBase.set(this, 'min', value);

  @override
  double? get max => RealmObjectBase.get<double>(this, 'max') as double?;
  @override
  set max(double? value) => RealmObjectBase.set(this, 'max', value);

  @override
  Stream<RealmObjectChanges<TemperatureDB>> get changes =>
      RealmObjectBase.getChanges<TemperatureDB>(this);

  @override
  TemperatureDB freeze() => RealmObjectBase.freezeObject<TemperatureDB>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(TemperatureDB._);
    return const SchemaObject(
        ObjectType.realmObject, TemperatureDB, 'TemperatureDB', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('min', RealmPropertyType.double, optional: true),
      SchemaProperty('max', RealmPropertyType.double, optional: true),
    ]);
  }
}
