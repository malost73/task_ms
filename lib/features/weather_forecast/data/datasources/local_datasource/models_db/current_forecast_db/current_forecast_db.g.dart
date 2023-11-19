// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_forecast_db.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CurrentForecastDB extends $CurrentForecastDB
    with RealmEntity, RealmObjectBase, RealmObject {
  CurrentForecastDB(
    ObjectId id, {
    int? dt,
    double? temp,
    int? pressure,
    int? humidity,
    double? windSpeed,
    Iterable<WeatherDB> weather = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'dt', dt);
    RealmObjectBase.set(this, 'temp', temp);
    RealmObjectBase.set(this, 'pressure', pressure);
    RealmObjectBase.set(this, 'humidity', humidity);
    RealmObjectBase.set(this, 'windSpeed', windSpeed);
    RealmObjectBase.set<RealmList<WeatherDB>>(
        this, 'weather', RealmList<WeatherDB>(weather));
  }

  CurrentForecastDB._();

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
  int? get pressure => RealmObjectBase.get<int>(this, 'pressure') as int?;
  @override
  set pressure(int? value) => RealmObjectBase.set(this, 'pressure', value);

  @override
  int? get humidity => RealmObjectBase.get<int>(this, 'humidity') as int?;
  @override
  set humidity(int? value) => RealmObjectBase.set(this, 'humidity', value);

  @override
  double? get windSpeed =>
      RealmObjectBase.get<double>(this, 'windSpeed') as double?;
  @override
  set windSpeed(double? value) => RealmObjectBase.set(this, 'windSpeed', value);

  @override
  RealmList<WeatherDB> get weather =>
      RealmObjectBase.get<WeatherDB>(this, 'weather') as RealmList<WeatherDB>;
  @override
  set weather(covariant RealmList<WeatherDB> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<CurrentForecastDB>> get changes =>
      RealmObjectBase.getChanges<CurrentForecastDB>(this);

  @override
  CurrentForecastDB freeze() =>
      RealmObjectBase.freezeObject<CurrentForecastDB>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CurrentForecastDB._);
    return const SchemaObject(
        ObjectType.realmObject, CurrentForecastDB, 'CurrentForecastDB', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('dt', RealmPropertyType.int, optional: true),
      SchemaProperty('temp', RealmPropertyType.double, optional: true),
      SchemaProperty('pressure', RealmPropertyType.int, optional: true),
      SchemaProperty('humidity', RealmPropertyType.int, optional: true),
      SchemaProperty('windSpeed', RealmPropertyType.double, optional: true),
      SchemaProperty('weather', RealmPropertyType.object,
          linkTarget: 'WeatherDB', collectionType: RealmCollectionType.list),
    ]);
  }
}
