import 'package:flutter/material.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/weatherInfoBox.dart';

class fiveRowDisplay extends StatelessWidget {
  final List<Map<String, String>> data;

  const fiveRowDisplay({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: data.map((dayData) {
        return weatherInfoBox(
          date: dayData['date']!,
          morningTemperature: dayData['morningTemperature']!,
          eveningTemperature: dayData['eveningTemperature']!,
        );
      }).toList(),
    );
  }
}