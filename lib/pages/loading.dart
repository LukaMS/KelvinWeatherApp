import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kelvin_weather/services/weatherProvider.dart';
import 'package:provider/provider.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUp(BuildContext context) async {
    try {
      final weatherProvider = Provider.of<WeatherProvider>(context, listen: false);
      await weatherProvider.fetchWeatherByCity('Toronto');
      await weatherProvider.fetchForecastByCity('Toronto');
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      // Handle error, if any
      print('Error occurred: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setUp(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 65, 13, 161),
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}