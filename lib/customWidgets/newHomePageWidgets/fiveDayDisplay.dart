import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kelvin_weather/services/fiveDayWeatherModel.dart';

class fiveDayDisplay extends StatelessWidget {
  final List<ForecastModel>? fiveDayWeatherData;

  const fiveDayDisplay({super.key, this.fiveDayWeatherData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 96, 33, 243).withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '5 Day Forecast',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'AM/PM',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15), // Spacing between title and content
          ...fiveDayWeatherData != null
              ? fiveDayWeatherData!
                  .map((dayWeather) => weatherRow(dayWeather))
                  .toList()
              : [const Text('Loading...', style: TextStyle(color: Colors.white))],
        ],
      ),
    );
  }

  Widget weatherRow(ForecastModel dayWeather) {
    final dayOfWeek = DateFormat('EEE').format(dayWeather.date); // Format date to day of the week
    final weatherIcon = Icon(Icons.wb_sunny, color: Colors.yellow); // Placeholder for weather icon
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dayOfWeek, // Day of the week
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(child: weatherIcon),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "${dayWeather.morningTemperature.round()} / ${dayWeather.eveningTemperature.round()}", // Max and Min temperature with AM/PM
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 20, 
                color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}