import 'package:flutter/material.dart';
import 'package:task_ms/api/city_name_api.dart';
import 'package:task_ms/models/city_name.dart';
import 'package:task_ms/models/city_name_list.dart';
import 'package:task_ms/utilities/constants.dart';
import 'package:task_ms/widgets/search_city_list.dart';

class SearchCityPage extends StatefulWidget {
  final bool isFirstStart;

  const SearchCityPage({Key? key, required this.isFirstStart})
      : super(key: key);

  @override
  State<SearchCityPage> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCityPage> {
  late TextEditingController _textEditingController;
  late String _cityName;
  late bool _isFirstStart;

  @override
  void initState() {
    super.initState();
    _cityName = '';
    _isFirstStart = widget.isFirstStart;
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    FocusManager.instance.primaryFocus?.unfocus();
    super.dispose();
  }

  Future<CityNameList?> _fetchCityName(String cityName) async {
    if (cityName.trim() != '') {
      var cityNames = await CityNameApi().fetchCityName(city: cityName);
      return cityNames;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _textEditingController,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: Strings.hintSearchField,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide: BorderSide.none),
          ),
          onChanged: (value) {
            setState(() {
              _cityName = value;
            });
          },
        ),
        actions: [
          _cityName != ''
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _cityName = '';
                      _textEditingController.clear();
                    });
                  },
                  icon: const Icon(Icons.clear))
              : Container(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: _fetchCityName(_cityName),
            builder:
                (BuildContext context, AsyncSnapshot<CityNameList?> snapshot) {
              if (snapshot.hasData) {
                List<CityName> cityNameList = snapshot.data?.cityName ?? [];
                return SearchCityList(
                    cityNameList: cityNameList, isFirstStart: _isFirstStart);
              } else if (_cityName == '') {
                return Container();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
