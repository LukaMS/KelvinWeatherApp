import 'package:flutter/material.dart';
import 'package:kelvin_weather/services/settingsProvider.dart';
import 'package:kelvin_weather/services/weatherModel.dart';
import 'package:provider/provider.dart';


class largeWeatherText extends StatelessWidget {
  final WeatherModel? weatherData;

  largeWeatherText({Key? key, this.weatherData}) : super(key: key);

  String formatTemperature(double tempInKelvin, String unit) {
    if (unit == 'Celsius') {
      return '${(tempInKelvin - 273.15).toStringAsFixed(1)}°C';
    } else {
      return '${tempInKelvin.toStringAsFixed(1)}K';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use Consumer to listen to UnitProvider
    return Consumer<SettingsProvider>(
      builder: (context, unitProvider, child) {
        String displayText;
        double fontSize = weatherData != null ? 80 : 40;

        if (weatherData != null) {
          // Get unit from UnitProvider
          displayText = formatTemperature(weatherData!.temperature, unitProvider.unit);
        } else {
          displayText = 'Loading...';
        }

        return Text(
          displayText,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.white,
          ),
        );
      },
    );
  }
}