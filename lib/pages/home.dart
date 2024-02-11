import 'package:flutter/material.dart';
import 'package:kelvin_weather/customWidgets/buttons/searchButton.dart';
import 'package:kelvin_weather/customWidgets/buttons/settingsButton.dart';
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
        backgroundColor: Color.fromARGB(255, 106, 26, 172),
        leading: const settingsButton(),
        title: const customMenu(),
        centerTitle: true,
        actions: const [
          searchButton(),
        ],
      ),
      body: const Stack(
        children: [
          Text("Kelvin Weather"),
        ],
      ),
    );
  }
}