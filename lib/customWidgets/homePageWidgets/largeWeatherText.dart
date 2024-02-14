import 'package:flutter/material.dart';
import 'package:kelvin_weather/services/weatherModel.dart';

class largeWeatherText extends StatelessWidget {

  WeatherModel? weatherData;

  largeWeatherText({Key? key, this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String displayText;
    double fontSize = weatherData != null ? 80 : 40;

    if (weatherData != null) {
      displayText = '${weatherData!.temperature} K';
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
  }

}