import 'package:flutter/material.dart';
import 'package:kelvin_weather/services/weatherModel.dart';
import 'package:kelvin_weather/services/weatherAPI.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherAPI weatherService;
  WeatherModel? _weatherData;
  String? _errorMessage;

  WeatherProvider({required this.weatherService});

  WeatherModel? get weatherData => _weatherData;
  String? get errorMessage => _errorMessage;

  Future<void> fetchWeather(String city) async {
    try {
      final weather = await weatherService.getWeather(city);
      _weatherData = weather;
      _errorMessage = null;
    } catch (e) {
      _weatherData = null;
      _errorMessage = 'Failed to fetch weather data';
    }
    notifyListeners();
  }
}