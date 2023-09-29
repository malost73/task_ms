import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                cursorColor: Colors.blueGrey[800],
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Город',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black87,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none),
                  icon: Icon(
                    Icons.location_city,
                    color: Colors.black87,
                    size: 50.0,
                  ),
                ),
                onChanged: (value) {
                  cityName = value;
                },
              ),
            ),
            TextButton(
              child: const Text(
                'Поиск',
                style: TextStyle(fontSize: 30.0),
              ),
              onPressed: () {
                Navigator.pop(context, cityName.trim());
              },
            ),
          ],
        ),
      ),
    );
  }
}
