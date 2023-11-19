// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_db.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class WeatherForecastDB extends $WeatherForecastDB
    with RealmEntity, RealmObjectBase, RealmObject {
  WeatherForecastDB(
    ObjectId id, {
    CoordinatesDB? coordinates,
    CurrentForecastDB? current,
    Iterable<HourlyForecastDB> hourly = const [],
    Iterable<DailyForecastDB> daily = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'coordinates', coordinates);
    RealmObjectBase.set(this, 'current', current);
    RealmObjectBase.set<RealmList<HourlyForecastDB>>(
        this, 'hourly', RealmList<HourlyForecastDB>(hourly));
    RealmObjectBase.set<RealmList<DailyForecastDB>>(
        this, 'daily', RealmList<DailyForecastDB>(daily));
  }

  WeatherForecastDB._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  CoordinatesDB? get coordinates =>
      RealmObjectBase.get<CoordinatesDB>(this, 'coordinates') as CoordinatesDB?;
  @override
  set coordinates(covariant CoordinatesDB? value) =>
      RealmObjectBase.set(this, 'coordinates', value);

  @override
  CurrentForecastDB? get current =>
      RealmObjectBase.get<CurrentForecastDB>(this, 'current')
          as CurrentForecastDB?;
  @override
  set current(covariant CurrentForecastDB? value) =>
      RealmObjectBase.set(this, 'current', value);

  @override
  RealmList<HourlyForecastDB> get hourly =>
      RealmObjectBase.get<HourlyForecastDB>(this, 'hourly')
          as RealmList<HourlyForecastDB>;
  @override
  set hourly(covariant RealmList<HourlyForecastDB> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<DailyForecastDB> get daily =>
      RealmObjectBase.get<DailyForecastDB>(this, 'daily')
          as RealmList<DailyForecastDB>;
  @override
  set daily(covariant RealmList<DailyForecastDB> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<WeatherForecastDB>> get changes =>
      RealmObjectBase.getChanges<WeatherForecastDB>(this);

  @override
  WeatherForecastDB freeze() =>
      RealmObjectBase.freezeObject<WeatherForecastDB>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(WeatherForecastDB._);
    return const SchemaObject(
        ObjectType.realmObject, WeatherForecastDB, 'WeatherForecastDB', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('coordinates', RealmPropertyType.object,
          optional: true, linkTarget: 'CoordinatesDB'),
      SchemaProperty('current', RealmPropertyType.object,
          optional: true, linkTarget: 'CurrentForecastDB'),
      SchemaProperty('hourly', RealmPropertyType.object,
          linkTarget: 'HourlyForecastDB',
          collectionType: RealmCollectionType.list),
      SchemaProperty('daily', RealmPropertyType.object,
          linkTarget: 'DailyForecastDB',
          collectionType: RealmCollectionType.list),
    ]);
  }
}
