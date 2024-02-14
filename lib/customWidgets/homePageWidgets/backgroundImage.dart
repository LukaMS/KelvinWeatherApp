// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class backgroundImage extends StatelessWidget {
  const backgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bgImages/dayNew.jpg'),
                fit: BoxFit.cover,
                ),
              ),
            ),
          );
  }
}