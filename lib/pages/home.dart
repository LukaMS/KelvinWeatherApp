import 'package:flutter/material.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/5dayLabel.dart';
import 'package:kelvin_weather/customWidgets/buttons/searchButton.dart';
import 'package:kelvin_weather/customWidgets/buttons/settingsButton.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/customMenu.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/fiveRowDisplay.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/largeWeatherText.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/timeDisplay.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    List<Map<String, String>> data = [
      {'date': 'Feb 10', 'morningTemperature': '10°C', 'eveningTemperature': '5°C'},
      {'date': 'Feb 11', 'morningTemperature': '12°C', 'eveningTemperature': '6°C'},
      {'date': 'Feb 12', 'morningTemperature': '11°C', 'eveningTemperature': '7°C'},
      {'date': 'Feb 13', 'morningTemperature': '9°C', 'eveningTemperature': '4°C'},
      {'date': 'Feb 14', 'morningTemperature': '8°C', 'eveningTemperature': '2°C'},
    ];


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        leading: const settingsButton(),
        title: const customMenu(),
        centerTitle: true,
        actions: const [
          searchButton(),
        ],
      ),
      body: Stack(
        children: [

          // Background Image
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bgImages/dayNew.jpg'),
                fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          //Beginning of the main content
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity, // Ensure the container takes up the full width
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Main Weather Temperature Display
                    const SizedBox(height: 100,),
                    const largeWeatherText(temperature: 10),
                    const SizedBox(height: 20,),

                    //Time Display Widget
                    timeDisplay(time: TimeOfDay.now()),
                    const SizedBox(height: 20,),
                    
                    //5 Day Label
                    const fivedayLabel(),

                    //5 Day Weather Display
                    fiveRowDisplay(data: data),

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