import 'package:flutter/material.dart';

class settingsButton extends StatelessWidget {

  const settingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
            icon: Icon(Icons.settings),
            iconSize: 35,
            color: Colors.black,
            onPressed: () async {
              Navigator.pushNamed(context, '/settings');
            },
          ); 
  }
}