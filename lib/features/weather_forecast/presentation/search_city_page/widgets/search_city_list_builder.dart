import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/constants/constants.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_state.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/widgets/search_city_list.dart';

class SearchCityListBuilder extends StatelessWidget {
  final bool isFirstStart;

  const SearchCityListBuilder({super.key, required this.isFirstStart});

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<SearchCityBloc>(context).state;
    if (state is SearchCityInitial) {
      return Container();
    } else if (state is SearchCityLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is SearchCityLoaded) {
      if (state.cityNameListEntity == null) {
        return const Center(child: Text(Constants.noCities));
      } else {
        return SearchCityList(
            isFirstStart: isFirstStart, cityList: state.cityNameListEntity!);
      }
    } else if (state is SearchCityError) {
      return Center(child: Text(state.message));
    }
    return Container();
  }
}
