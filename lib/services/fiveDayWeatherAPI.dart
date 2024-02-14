import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ForecastAPI {
  final String apiKey;
  final String baseUrl;

  ForecastAPI({required this.apiKey, required this.baseUrl});

  Future<List<Map<String, dynamic>>> getForecastByCity(String cityName) async {
    final response = await http.get(Uri.parse('$baseUrl?q=$cityName&appid=$apiKey'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return _extractTemperatureData(jsonData);
    } else {
      throw Exception('Failed to load forecast');
    }
  }

  Future<List<Map<String, dynamic>>> getForecastByLocation(double lat, double lon) async {
    final response = await http.get(Uri.parse('$baseUrl?lat=$lat&lon=$lon&appid=$apiKey'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return _extractTemperatureData(jsonData);
    } else {
      throw Exception('Failed to load forecast');
    }
  }

  List<Map<String, dynamic>> _extractTemperatureData(dynamic jsonData) {
  List<dynamic> forecasts = jsonData['list'];
  Map<String, Map<String, dynamic>> forecastData = {};

  for (var forecast in forecasts) {
    DateTime dateTime = DateTime.parse(forecast['dt_txt']);
    String date = DateFormat('yyyy-MM-dd').format(dateTime).toString();
    int hour = dateTime.hour;

    if (hour == 9) {
      // Morning temperature
      if (!forecastData.containsKey(date)) {
        forecastData[date] = {
          'date': DateFormat('yyyy-MM-dd').parse(date).toString(),
          'morningTemperature': forecast['main']['temp']
        };
      }
    } else if (hour == 21) {
      // Evening temperature
      if (forecastData.containsKey(date)) {
        forecastData[date]?['eveningTemperature'] = forecast['main']['temp'];
      }
    }
  }
  return forecastData.values.toList();
}
}