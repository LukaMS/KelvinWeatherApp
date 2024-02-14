class WeatherModel {

  final String cityName;
  final double temperature;
  // Add more properties as needed
  
  WeatherModel({
    required this.cityName,
    required this.temperature,
    // Add more constructor parameters as needed
  });

  factory WeatherModel.fromJson(Map<String, dynamic> jsonData) {
    return WeatherModel(
      cityName: jsonData['name'],
      temperature: jsonData['main']['temp'].toDouble(),
      // Parse more properties from the JSON response
    );
  }
}