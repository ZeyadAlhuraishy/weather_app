import 'package:flutter/material.dart';

class NoWeatherPage extends StatelessWidget {
  const NoWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'There is no weather 😔 start',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      );
  }
}