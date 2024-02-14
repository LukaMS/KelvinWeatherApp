import 'package:flutter/material.dart';
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
                title: const Text('Use Kelvin Units'),
                leading: const Icon(Icons.phone_android),
                initialValue: true,
                onToggle: (bool value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}