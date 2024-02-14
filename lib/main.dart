import 'package:flutter/material.dart';
import 'package:kelvin_weather/pages/home.dart';
import 'package:kelvin_weather/pages/loading.dart';
import 'package:kelvin_weather/pages/search.dart';
import 'package:kelvin_weather/pages/settings.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/search': (context) => const Search(),
      '/settings': (context) => const Settings(),
    }
  ));
}
