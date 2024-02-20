import 'package:flutter/material.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/5dayLabel.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/backgroundImage.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/homeAppBar.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/fiveRowDisplay.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/largeWeatherText.dart';
import 'package:kelvin_weather/customWidgets/newHomePageWidgets/fiveDayDisplay.dart';
import 'package:kelvin_weather/customWidgets/newHomePageWidgets/mainWeatherDisplay.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/timeDisplay.dart';
import 'package:kelvin_weather/customWidgets/newHomePageWidgets/specificWeatherInfo.dart';
import 'package:kelvin_weather/services/weatherProvider.dart';
import 'package:provider/provider.dart';

class newHome extends StatefulWidget {
  const newHome({super.key});

  @override
  State<newHome> createState() => _HomeState();
}

class _HomeState extends State<newHome> {
  @override
  Widget build(BuildContext context) {

    
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: homeAppBar(weatherData: weatherProvider.weatherData),
      ),
      body: Stack(
        children: [

          // Background Image
          

          //Beginning of the main content
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity, // Ensure the container takes up the full width
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Main Weather Display
                    mainWeatherDisplay(weatherData: weatherProvider.weatherData),
                    //Specific Weather Information (humiditiy... etc)
                    const SizedBox(height: 20),
                    specificWeatherInfo(weatherData: weatherProvider.weatherData),
                    //5 Day Weather Display
                    const SizedBox(height: 20),
                    fiveDayDisplay(fiveDayWeatherData: weatherProvider.forecastDataList ?? []),
                    const SizedBox(height: 200),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}