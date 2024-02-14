import 'package:flutter/material.dart';

class timeDisplay extends StatelessWidget {
  final TimeOfDay? time;

  const timeDisplay({Key? key, this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String displayText = time != null ? '${time!.hour}:${time!.minute}' : 'No time provided';

    return Text(
      displayText,
      style: TextStyle(
        fontSize: time != null ? 60 : 20,
        color: Colors.white,
      ),
    );
  }
}