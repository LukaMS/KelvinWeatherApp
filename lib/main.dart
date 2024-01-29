import 'package:flutter/material.dart';
import 'package:kelvin_weather/pages/home.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Home(),
    }
  ));
}
