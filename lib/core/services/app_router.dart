import 'package:auto_route/auto_route.dart';
import 'package:task_ms/core/services/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: SavedCitiesRoute.page,
        ),
        AutoRoute(
          page: SearchCityRoute.page,
        ),
        AutoRoute(
          page: WeatherForecastRoute.page,
        ),
      ];
}
