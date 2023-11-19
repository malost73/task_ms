class ConstantsApi {
  static const String weatherAppId = '1369dd6b5ae78fc9952261ab9aa236b4';
  static const String weatherUnits = 'metric';
  static const String weatherLang = 'ru';
  static const String weatherExclude = 'minutely';
  static const String weatherBaseScheme = 'https://';
  static const String weatherBaseUrlDomain = 'api.openweathermap.org';
  static const String weatherForecastPath = '/data/2.5/onecall';
  static const String cityNamePath = '/geo/1.0/direct';
  static const String cityLimit = '5';
  static const int successResponseCode = 200;
  static const String weatherImagesPath = '/img/w/';
  static const String weatherImagesUrl =
      weatherBaseScheme + weatherBaseUrlDomain + weatherImagesPath;
  static const String weatherForecastUrl =
      weatherBaseUrlDomain + weatherForecastPath;
}
