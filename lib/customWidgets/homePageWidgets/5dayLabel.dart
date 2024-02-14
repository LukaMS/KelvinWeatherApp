import 'package:flutter/material.dart';

class fivedayLabel extends StatelessWidget {
  const fivedayLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '5 Day',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30, 
                      ),
                    )
                  ],
                ),
              );
  }
}