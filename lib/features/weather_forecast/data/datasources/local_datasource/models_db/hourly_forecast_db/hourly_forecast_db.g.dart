// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_forecast_db.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class HourlyForecastDB extends $HourlyForecastDB
    with RealmEntity, RealmObjectBase, RealmObject {
  HourlyForecastDB(
    ObjectId id, {
    int? dt,
    double? temp,
    Iterable<WeatherDB> weather = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'dt', dt);
    RealmObjectBase.set(this, 'temp', temp);
    RealmObjectBase.set<RealmList<WeatherDB>>(
        this, 'weather', RealmList<WeatherDB>(weather));
  }

  HourlyForecastDB._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  int? get dt => RealmObjectBase.get<int>(this, 'dt') as int?;
  @override
  set dt(int? value) => RealmObjectBase.set(this, 'dt', value);

  @override
  double? get temp => RealmObjectBase.get<double>(this, 'temp') as double?;
  @override
  set temp(double? value) => RealmObjectBase.set(this, 'temp', value);

  @override
  RealmList<WeatherDB> get weather =>
      RealmObjectBase.get<WeatherDB>(this, 'weather') as RealmList<WeatherDB>;
  @override
  set weather(covariant RealmList<WeatherDB> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<HourlyForecastDB>> get changes =>
      RealmObjectBase.getChanges<HourlyForecastDB>(this);

  @override
  HourlyForecastDB freeze() =>
      RealmObjectBase.freezeObject<HourlyForecastDB>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(HourlyForecastDB._);
    return const SchemaObject(
        ObjectType.realmObject, HourlyForecastDB, 'HourlyForecastDB', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('dt', RealmPropertyType.int, optional: true),
      SchemaProperty('temp', RealmPropertyType.double, optional: true),
      SchemaProperty('weather', RealmPropertyType.object,
          linkTarget: 'WeatherDB', collectionType: RealmCollectionType.list),
    ]);
  }
}
