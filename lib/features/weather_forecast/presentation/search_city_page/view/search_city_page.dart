import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_city_name_list.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_state.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/widgets/search_city_list_builder.dart';
import 'package:task_ms/utilities/constants.dart';

@RoutePage()
class SearchCityPage extends StatelessWidget {
  final bool isFirstStart;

  const SearchCityPage({super.key, required this.isFirstStart});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return BlocProvider(
      create: (context) => SearchCityBloc(context.read<GetCityNameList>()),
      child: BlocBuilder<SearchCityBloc, SearchCityState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: TextField(
                controller: textController,
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: Constants.hintSearchField,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none),
                ),
                onChanged: (value) {
                  if (textController.text.isNotEmpty) {
                    context.read<SearchCityBloc>().add(
                        SearchCityNameListEvent(cityName: textController.text));
                  } else {
                    context
                        .read<SearchCityBloc>()
                        .add(SearchCityToInitialEvent());
                  }
                },
              ),
              actions: [
                textController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          textController.clear();
                          context
                              .read<SearchCityBloc>()
                              .add(SearchCityToInitialEvent());
                        },
                        icon: const Icon(Icons.clear))
                    : Container(),
              ],
            ),
            body: SearchCityListBuilder(isFirstStart: isFirstStart),
          );
        },
      ),
    );
  }
}
