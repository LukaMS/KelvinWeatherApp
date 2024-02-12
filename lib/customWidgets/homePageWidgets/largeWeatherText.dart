import 'package:flutter/material.dart';

class largeWeatherText extends StatelessWidget {

  final double temperature;

  const largeWeatherText({Key? key, this.temperature = double.nan}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String displayText = temperature.isNaN ? 'No temperature Found' : '$temperature°C';

    return Text(
      displayText,
      style: TextStyle(
        fontSize: temperature.isNaN ? 40 : 80,
        color: Colors.white,
      ),
    );
  }

}