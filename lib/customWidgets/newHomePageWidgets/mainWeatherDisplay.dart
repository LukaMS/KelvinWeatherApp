import 'package:flutter/material.dart';
import 'package:kelvin_weather/services/weatherModel.dart';

class mainWeatherDisplay extends StatelessWidget {
  final WeatherModel? weatherData;

  const mainWeatherDisplay({super.key, this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Ensure the Container takes up the full width
      margin: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Expanded widget for Main Weather Temperature Display with green background
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weatherData != null ? '${weatherData!.temperature.toStringAsFixed(1)}K' : 'Loading...',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10), // Spacing between temperature and "Feels like" text
                  Text(
                    weatherData != null ? 'Feels ${weatherData!.feelsLike.toStringAsFixed(1)}K' : 'Loading...',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Expanded widget for Icon Display Widget with orange background
          Expanded(
            child: Container(
              child: Center( // Explicitly center the image vertically and horizontally
                child: weatherData != null
                    ? Image.asset(
                        'assets/weatherIcons/half_moon.png',
                        width: 90, // Specify the image width
                        height: 90, // Specify the image height
                      )
                    : Image.asset(
                        'assets/weatherIcons/na.png', // Placeholder image if weather data is null
                        width: 70,
                        height: 70,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}