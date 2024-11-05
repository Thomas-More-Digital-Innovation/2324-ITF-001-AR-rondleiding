import 'package:flutter/material.dart';
import 'package:code/components/PositionedButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(20),
          minScale: 0.5,
          maxScale: 3.0,

          child: Stack(
            children: [
              Image.asset(
                'assets/images/grondplan_rondleiding_groot.jpg', // Place your image in the assets folder
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
              ),
              // Buttons placed at specific locations
              const PositionedButton(index: 1, x: 0, y: 100),
              const PositionedButton(index: 2, x: 50, y: 400),
              const PositionedButton(index: 3, x: 350, y: 200),
              // Add more PositionedButton widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}
