import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_city_name_list.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_state.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/widgets/seach_city_list.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/widgets/search_city_list_builder.dart';
import 'package:task_ms/utilities/constants.dart';
import 'package:task_ms/utilities/show_toast.dart';
// import 'package:task_ms/widgets/city_list_builder.dart';

@RoutePage()
class SearchCityPage extends StatefulWidget {
  final bool isFirstStart;

  const SearchCityPage({super.key, required this.isFirstStart});

  @override
  State<SearchCityPage> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCityPage> {
  final TextEditingController _textEditingController = TextEditingController();
  String _cityName = '';

  @override
  void dispose() {
    FocusManager.instance.primaryFocus?.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCityBloc(context.read<GetCityNameList>()),
      child: BlocBuilder<SearchCityBloc, SearchCityState>(
        builder: (context, state) {
          if (state is SearchCityInitial) {
            _cityName = '';
            _textEditingController.clear();
            return Container();
          } else if (state is SearchCityLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SearchCityLoaded) {
            final cityList = state.cityNameListModel!.cityNameList;
            if (cityList!.isEmpty) {
              context.read<SearchCityBloc>().add(SearchCityToInitialEvent());
              // return const Text('No found');
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: TextField(
                    controller: _textEditingController,
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
                      _cityName = value;
                      context
                          .read<SearchCityBloc>()
                          .add(SearchCityNameListEvent(cityName: _cityName));

                      // setState(() {
                      //   _cityName = value;
                      // });
                    },
                  ),
                  actions: [
                    _cityName.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              _cityName = '';
                              _textEditingController.clear();
                              context
                                  .read<SearchCityBloc>()
                                  .add(SearchCityToInitialEvent());
                              // setState(() {
                              // });
                            },
                            icon: const Icon(Icons.clear))
                        : Container(),
                  ],
                ),
                body: SearchCityList(
                    isFirstStart: widget.isFirstStart, cityNameList: cityList),
              );
            }
          } else if (state is SearchCityError) {
            // return _showErrorText(state.message);
            return const Text('error');
          }
          return Container(color: Colors.red);
        },
      ),
    );
  }
}
