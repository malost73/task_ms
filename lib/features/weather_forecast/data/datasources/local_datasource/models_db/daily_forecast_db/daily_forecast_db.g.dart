// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast_db.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class DailyForecastDB extends $DailyForecastDB
    with RealmEntity, RealmObjectBase, RealmObject {
  DailyForecastDB(
    ObjectId id, {
    int? dt,
    TemperatureDB? temp,
    Iterable<WeatherDB> weather = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'dt', dt);
    RealmObjectBase.set(this, 'temp', temp);
    RealmObjectBase.set<RealmList<WeatherDB>>(
        this, 'weather', RealmList<WeatherDB>(weather));
  }

  DailyForecastDB._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  int? get dt => RealmObjectBase.get<int>(this, 'dt') as int?;
  @override
  set dt(int? value) => RealmObjectBase.set(this, 'dt', value);

  @override
  TemperatureDB? get temp =>
      RealmObjectBase.get<TemperatureDB>(this, 'temp') as TemperatureDB?;
  @override
  set temp(covariant TemperatureDB? value) =>
      RealmObjectBase.set(this, 'temp', value);

  @override
  RealmList<WeatherDB> get weather =>
      RealmObjectBase.get<WeatherDB>(this, 'weather') as RealmList<WeatherDB>;
  @override
  set weather(covariant RealmList<WeatherDB> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<DailyForecastDB>> get changes =>
      RealmObjectBase.getChanges<DailyForecastDB>(this);

  @override
  DailyForecastDB freeze() =>
      RealmObjectBase.freezeObject<DailyForecastDB>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(DailyForecastDB._);
    return const SchemaObject(
        ObjectType.realmObject, DailyForecastDB, 'DailyForecastDB', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('dt', RealmPropertyType.int, optional: true),
      SchemaProperty('temp', RealmPropertyType.object,
          optional: true, linkTarget: 'TemperatureDB'),
      SchemaProperty('weather', RealmPropertyType.object,
          linkTarget: 'WeatherDB', collectionType: RealmCollectionType.list),
    ]);
  }
}
