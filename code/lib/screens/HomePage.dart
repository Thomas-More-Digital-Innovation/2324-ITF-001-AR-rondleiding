import 'package:flutter/material.dart';
import 'package:code/components/PositionedButton.dart';
import 'package:code/components/BottomNavigationHome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main interactive viewer with the image and positioned buttons
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(20),
              minScale: 0.1,
              maxScale: 2.0,
              constrained: false,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/grondplan_rondleiding_groot.jpg',
                    fit: BoxFit.fitHeight,
                    height: MediaQuery.of(context).size.height* 0.90,
                  ),
                  // Custom positioned buttons
                  const PositionedButton(index: 1, x: 140, y: 200),
                  const PositionedButton(index: 2, x: 850, y: 240),
                ],
              ),
            ),
          ),
          // Overlay positioned at the bottom with a camera button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomCameraOverlay(),
          ),
        ],
      ),
    );
  }
}