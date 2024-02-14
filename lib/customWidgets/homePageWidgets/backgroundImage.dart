// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:kelvin_weather/services/weatherModel.dart';

// ignore: camel_case_types
class backgroundImage extends StatelessWidget {
  WeatherModel? weatherData;

  backgroundImage({Key? key, this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String imagePath = weatherData!.dateTime > weatherData!.sunrise && weatherData!.dateTime < weatherData!.sunset ? 'assets/bgImages/day.jpg' : 'assets/bgImages/night.jpg';

    return Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                ),
              ),
            ),
          );
  }
}