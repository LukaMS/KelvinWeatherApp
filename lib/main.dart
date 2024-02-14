import 'package:flutter/material.dart';
import 'package:kelvin_weather/pages/home.dart';
import 'package:kelvin_weather/pages/search.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Search(),
    }
  ));
}
