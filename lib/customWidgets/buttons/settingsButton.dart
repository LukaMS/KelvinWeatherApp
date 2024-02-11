import 'package:flutter/material.dart';

class settingsButton extends StatelessWidget {

  const settingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
            icon: Icon(Icons.settings),
            color: Colors.white,
            onPressed: () async {
              // Navigate to the settings page
              // Navigator.pushNamed(context, '/settings');
            },
          ); 
  }
}