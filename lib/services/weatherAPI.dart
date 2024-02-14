import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kelvin_weather/services/weatherModel.dart';

class WeatherAPI{
  final String apiKey;
  final String baseUrl;

  WeatherAPI({required this.apiKey, required this.baseUrl});

  Future<WeatherModel> getWeather(String city) async {
    // Construct URL for API request
    final apiUrl = '$baseUrl?q=$city&appid=$apiKey';

    // Make HTTP GET request
    final response = await http.get(Uri.parse(apiUrl));

    // Check if request was successful
    if (response.statusCode == 200) {
      // Parse JSON response
      final jsonData = jsonDecode(response.body);
      
      // Create WeatherModel object from JSON data
      final weatherData = WeatherModel.fromJson(jsonData);

      return weatherData;
    } else {
      // If request was not successful, throw an error
      throw Exception('Failed to load weather data');
    }
  }
}