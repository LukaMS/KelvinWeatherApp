import 'package:flutter/material.dart';
import 'package:kelvin_weather/customWidgets/customMenu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customMenu(),
      ),
      body: Stack(
        children: [
          Text("Kelvin Weather"),
        ],
      ),
    );
  }
}