import 'package:flutter/material.dart';
import 'package:task_ms/utilities/constants.dart';
import 'package:task_ms/widgets/city_list_builder.dart';

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
            setState(() {
              _cityName = value;
            });
          },
        ),
        actions: [
          _cityName.isNotEmpty
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
      body: CityListBuilder(
          isFirstStart: widget.isFirstStart, cityName: _cityName),
    );
  }
}
