import 'package:flutter/material.dart';
import 'package:task_ms/utilities/constants.dart';

class CurrentLocation extends StatelessWidget {
  final Function onTap;

  const CurrentLocation({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: ProjectColors.widgetComponent,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ListTile(
              onTap: () => onTap(null),
              leading: const Icon(Icons.location_on),
              title: const Text(Strings.myLocation),
            ),
          ),
        ),
      ),
    );
  }
}
