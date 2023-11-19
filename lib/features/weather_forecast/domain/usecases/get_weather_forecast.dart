import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/core/usecases/base_usecase.dart';
import 'package:task_ms/features/weather_forecast/domain/models/coordinates_model.dart';
import 'package:task_ms/features/weather_forecast/domain/models/weather_forecast_model.dart';
import 'package:task_ms/features/weather_forecast/domain/repositories/weather_forecast_repository.dart';
// import 'package:injectable/injectable.dart';

// @injectable
class GetWeatherForecast
    implements BaseUseCase<WeatherForecastModel?, CoordinatesModel> {
  GetWeatherForecast(this.weatherForecastRepository);

  final WeatherForecastRepository weatherForecastRepository;

  @override
  Future<Either<Failure, WeatherForecastModel?>> call(
      CoordinatesModel? coordinatesModel) {
    return weatherForecastRepository.getWeatherForecast(
        coordinates: coordinatesModel);
  }
}
