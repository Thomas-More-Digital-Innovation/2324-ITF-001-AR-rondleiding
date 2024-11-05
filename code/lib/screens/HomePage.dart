import 'package:flutter/material.dart';
import 'package:code/components/PositionedButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(20),
        minScale: 0.1,
        maxScale: 5.0,
        panEnabled: false,

        child: Stack(
          children: [
            Image.asset(
              'assets/images/grondplan_rondleiding_groot.jpg', // Place your image in the assets folder
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            ),
            // Buttons placed at specific locations
            const PositionedButton(index: 1, x: 100, y: 150),
            // Add more PositionedButton widgets as needed
          ],
        ),
      ),
    );
  }
}
