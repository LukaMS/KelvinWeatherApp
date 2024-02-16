import 'package:flutter/material.dart';
import 'package:kelvin_weather/services/settingsProvider.dart';
import 'package:kelvin_weather/services/userPreferences.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
          ),
          ),
        backgroundColor: const Color.fromARGB(255, 65, 13, 161),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile.switchTile(
                title: const Text('Use Kelvin Units - Test'),
                leading: const Icon(Icons.phone_android),
                initialValue: Provider.of<SettingsProvider>(context, listen: false).unit == 'Kelvin',
                onToggle: (bool value) {
                  setState(() {
                    Provider.of<SettingsProvider>(context, listen: false).setUnit(value ? 'Kelvin' : 'Celsius');
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}