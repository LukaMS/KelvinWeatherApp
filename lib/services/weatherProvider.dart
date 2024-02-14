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

  // Method to fetch weather data by city name
  Future<void> fetchWeatherByCity(String city) async {
    try {
      final weather = await weatherService.getWeatherByCity(city);
      _weatherData = weather;
      _errorMessage = null;
    } catch (e) {
      _weatherData = null;
      _errorMessage = 'Failed to fetch weather data';
    }
    notifyListeners();
  }

  // Method to fetch weather data by latitude and longitude
  Future<void> fetchWeatherByLocation(double latitude, double longitude) async {
    try {
      final weather = await weatherService.getWeatherByLocation(latitude, longitude);
      _weatherData = weather;
      _errorMessage = null;
    } catch (e) {
      _weatherData = null;
      _errorMessage = 'Failed to fetch weather data';
    }
    notifyListeners();
  }
}