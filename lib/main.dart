import 'package:flutter/material.dart';
import 'package:kelvin_weather/pages/home.dart';
import 'package:kelvin_weather/pages/loading.dart';
import 'package:kelvin_weather/pages/newHome.dart';
import 'package:kelvin_weather/pages/search.dart';
import 'package:kelvin_weather/pages/settings.dart';
import 'package:kelvin_weather/services/fiveDayWeatherAPI.dart';
import 'package:kelvin_weather/services/settingsProvider.dart';
import 'package:kelvin_weather/services/userPreferences.dart';
import 'package:kelvin_weather/services/weatherProvider.dart';
import 'package:kelvin_weather/services/weatherAPI.dart';
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(
            weatherService: WeatherAPI(
              apiKey: "c297d303d660b9ab12f7df0e1101fcee",
              baseUrl: "https://api.openweathermap.org/data/2.5/weather",
            ), forecastService: ForecastAPI(
              apiKey: "c297d303d660b9ab12f7df0e1101fcee",
              baseUrl: "https://api.openweathermap.org/data/2.5/forecast",
            )
          ),
        ),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Loading(),
          '/home': (context) => const newHome(),
          '/search': (context) => const Search(),
          '/settings': (context) => const Settings(),
        }
      ),
    )    
  );
}
