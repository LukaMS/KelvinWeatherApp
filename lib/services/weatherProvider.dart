import 'package:flutter/material.dart';
import 'package:kelvin_weather/services/fiveDayWeatherAPI.dart';
import 'package:kelvin_weather/services/fiveDayWeatherModel.dart';
import 'package:kelvin_weather/services/weatherModel.dart';
import 'package:kelvin_weather/services/weatherAPI.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherAPI weatherService;
  final ForecastAPI forecastService;
  WeatherModel? _weatherData;
  String? _errorMessage;
  List<ForecastModel>? _forecastDataList;

  WeatherProvider({required this.weatherService, required this.forecastService});

  WeatherModel? get weatherData => _weatherData; // Getter for weather data
  List<ForecastModel>? get forecastDataList => _forecastDataList; // Getter for forecast data list
  String? get errorMessage => _errorMessage; // Getter for error message

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

  Future<void> fetchForecastByCity(String city) async {
    try {
      final forecast = await forecastService.getForecastByCity(city);
      _forecastDataList = forecast.map((data) => ForecastModel.fromJson(data)).toList();
      _errorMessage = null;
    } catch (e) {
      _forecastDataList = null;
      _errorMessage = 'Failed to fetch forecast data';
    }
    notifyListeners();
  }

  Future<void> fetchForecastByLocation(double latitude, double longitude) async {
    try {
      final forecast = await forecastService.getForecastByLocation(latitude, longitude);
      _forecastDataList = forecast.map((data) => ForecastModel.fromJson(data)).toList();
      _errorMessage = null;
    } catch (e) {
      _forecastDataList = null;
      _errorMessage = 'Failed to fetch forecast data';
    }
    notifyListeners();
  }

}