import 'package:flutter/material.dart';

class searchButton extends StatelessWidget {
  const searchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
              color: Colors.white,
              icon: Icon(Icons.search),
              onPressed: () async {
                // Navigate to the search page
                // Navigator.pushNamed(context, '/search');
              },
            );
  }
}