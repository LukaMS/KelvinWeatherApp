// ignore_for_file: file_names

import 'package:flutter/material.dart';

class searchButton extends StatelessWidget {
  const searchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
              color: Colors.white,
              icon: const Icon(Icons.search),
              onPressed: () async {
                Navigator.pushNamed(context, '/search');
              },
            );
  }
}