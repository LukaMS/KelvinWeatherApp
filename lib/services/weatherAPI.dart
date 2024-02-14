import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kelvin_weather/services/weatherModel.dart';

class WeatherAPI {
  final String apiKey;
  final String baseUrl;

  WeatherAPI({required this.apiKey, required this.baseUrl});


  //"Overloading" the getWeather method to accept either city name or location coordinates
  Future<WeatherModel> getWeatherByCity(String city) async {
    final apiUrl = '$baseUrl?q=$city&appid=$apiKey';
    return _fetchWeather(apiUrl);
  }

  Future<WeatherModel> getWeatherByLocation(double latitude, double longitude) async {
    final apiUrl = '$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey';
    return _fetchWeather(apiUrl);
  }

  //Method to fetch weather data from the OpenWeatherMap API
  Future<WeatherModel> _fetchWeather(String apiUrl) async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final weatherData = WeatherModel.fromJson(jsonData);
      return weatherData;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}