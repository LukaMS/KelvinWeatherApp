import 'package:flutter/material.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/customMenu.dart';
import 'package:kelvin_weather/customWidgets/buttons/searchButton.dart';
import 'package:kelvin_weather/customWidgets/buttons/settingsButton.dart';
import 'package:kelvin_weather/services/weatherModel.dart';

// ignore: camel_case_types
class homeAppBar extends StatelessWidget {
  
  WeatherModel? weatherData;

  homeAppBar({Key? key, this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        leading: const settingsButton(),
        title: customMenu(weatherData: weatherData),
        centerTitle: true,
        actions: const [
          searchButton(),
        ],
      );
  }
}