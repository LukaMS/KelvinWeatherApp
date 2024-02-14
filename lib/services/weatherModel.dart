import 'package:intl/intl.dart';

class WeatherModel {
  final String cityName;
  final double temperature;
  final String countryCode;
  late String flagEmoji; // Add flag emoji property
  final String time;
  final double sunrise;
  final double sunset;
  final double dateTime;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.countryCode,
    required this.time,
    required this.sunrise,
    required this.sunset,
    required this.dateTime,
  }) {
    flagEmoji = _getFlagEmoji(countryCode); // Initialize flag emoji
  }

  factory WeatherModel.fromJson(Map<String, dynamic> jsonData) {
    return WeatherModel(
      cityName: jsonData['name'],
      temperature: jsonData['main']['temp'].toDouble(),
      countryCode: jsonData['sys']['country'],
      time: _getTime(jsonData['timezone']),
      sunrise: jsonData['sys']['sunrise'].toDouble(),
      sunset: jsonData['sys']['sunset'].toDouble(),
      dateTime: jsonData['dt'].toDouble(),
    );
  }

  String _getFlagEmoji(String countryCode) {
    int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
    int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

  static String _getTime(int timezone) {
    //Get millisenconds since epoch and add the timezone difference
    int sinceEpoch = DateTime.now().millisecondsSinceEpoch;
    int timestamp = sinceEpoch + timezone*1000;

    // Convert unix time into regular time and account for timechange from UTC
    String unixTime = DateTime.fromMillisecondsSinceEpoch(timestamp.toInt()).toString();
    DateTime now = DateTime.parse(unixTime).toUtc();
    return DateFormat.jm().format(now);
  }
}