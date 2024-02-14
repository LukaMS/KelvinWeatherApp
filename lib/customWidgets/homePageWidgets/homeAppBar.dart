import 'package:flutter/material.dart';
import 'package:kelvin_weather/customWidgets/homePageWidgets/customMenu.dart';
import 'package:kelvin_weather/customWidgets/buttons/searchButton.dart';
import 'package:kelvin_weather/customWidgets/buttons/settingsButton.dart';

// ignore: camel_case_types
class homeAppBar extends StatelessWidget {
  const homeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        leading: const settingsButton(),
        title: const customMenu(),
        centerTitle: true,
        actions: const [
          searchButton(),
        ],
      );
  }
}