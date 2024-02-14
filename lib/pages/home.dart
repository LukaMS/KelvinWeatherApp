import 'package:flutter/material.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/5dayLabel.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/backgroundImage.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/homeAppBar.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/fiveRowDisplay.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/largeWeatherText.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/timeDisplay.dart';
import 'package:kelvin_weather/services/weatherProvider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    
    final weatherProvider = Provider.of<WeatherProvider>(context);
    print(weatherProvider.forecastDataList);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: homeAppBar(weatherData: weatherProvider.weatherData),
      ),
      body: Stack(
        children: [

          // Background Image
          const backgroundImage(),

          //Beginning of the main content
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity, // Ensure the container takes up the full width
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Main Weather Temperature Display
                    const SizedBox(height: 200,),
                    largeWeatherText(weatherData: weatherProvider.weatherData),
                    const SizedBox(height: 20,),

                    //Time Display Widget
                    timeDisplay(time: TimeOfDay.now()),
                    const SizedBox(height: 20,),
                    
                    //5 Day Label
                    const fivedayLabel(),

                    //5 Day Weather Display
                    fiveRowDisplay(forecastDataList: weatherProvider.forecastDataList ?? []),
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