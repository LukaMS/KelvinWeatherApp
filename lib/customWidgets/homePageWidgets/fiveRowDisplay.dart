import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import DateFormat
import 'package:kelvin_weather/customWidgets/homePageWidgets/weatherInfoBox.dart';
import 'package:kelvin_weather/services/fiveDayWeatherModel.dart';

class fiveRowDisplay extends StatelessWidget {
  final List<ForecastModel> forecastDataList;

  const fiveRowDisplay({Key? key, required this.forecastDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: forecastDataList.map((forecastData) {
        // Format the date
        String formattedDate = DateFormat('MMM dd').format(forecastData.date);
        return weatherInfoBox(
          date: formattedDate,
          morningTemperature: forecastData.morningTemperature.toString(),
          eveningTemperature: forecastData.eveningTemperature.toString(),
        );
      }).toList(),
    );
  }
}