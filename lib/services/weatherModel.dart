class WeatherModel {
  final String cityName;
  final double temperature;
  final String countryCode;
  late String flagEmoji; // Add flag emoji property

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.countryCode,
  }) {
    flagEmoji = _getFlagEmoji(countryCode); // Initialize flag emoji
  }

  factory WeatherModel.fromJson(Map<String, dynamic> jsonData) {
    return WeatherModel(
      cityName: jsonData['name'],
      temperature: jsonData['main']['temp'].toDouble(),
      countryCode: jsonData['sys']['country'],
    );
  }

  String _getFlagEmoji(String countryCode) {
    int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
    int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }
}