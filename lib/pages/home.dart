import 'package:flutter/material.dart';
import 'package:kelvin_weather/customWidgets/buttons/searchButton.dart';
import 'package:kelvin_weather/customWidgets/buttons/settingsButton.dart';
import 'package:kelvin_weather/customWidgets/customMenu.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Kelvin Weather",
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    SizedBox(height: 1000,),
                    Text(
                      "Kelvin Weather",
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
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