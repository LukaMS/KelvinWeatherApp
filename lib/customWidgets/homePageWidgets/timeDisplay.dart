import 'package:flutter/material.dart';
import 'package:kelvin_weather/services/weatherModel.dart';

class timeDisplay extends StatelessWidget {
  final WeatherModel? weatherData;

  const timeDisplay({Key? key, this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String displayText = weatherData != null ? weatherData!.time : 'No time provided';

    return Text(
      displayText,
      style: TextStyle(
        fontSize: weatherData != null ? 60 : 20,
        color: Colors.white,
      ),
    );
  }
}