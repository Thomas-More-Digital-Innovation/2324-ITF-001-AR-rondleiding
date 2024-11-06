import 'package:flutter/material.dart';

import '../screens/CameraPage.dart';

class Bottomnavigationhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Color(0xFF0A2B45), // Dark blue color
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none, // Allow the button to overflow outside the container
          children: [
            // Position the button halfway above the top edge
            Positioned(
              top: -40, // Adjust this value to control the vertical offset
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CameraPage(index: 0),
                    ),
                  );
                },
                icon: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer dark blue circle (slightly bigger)
                    Container(
                      padding: const EdgeInsets.all(60), // Larger padding for the outer circle
                      decoration: const BoxDecoration(
                        color: Color(0xFF0A2B45),
                        shape: BoxShape.circle,
                      ),
                    ),
                    // Inner white circle (slightly smaller)
                    Container(
                      padding: const EdgeInsets.all(50), // Smaller padding for the inner circle
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    // Orange camera icon
                    const Icon(
                      Icons.camera,
                      color: Colors.orange,
                      size: 60, // Adjust icon size as needed
                    ),
                  ],
                ),
                padding: EdgeInsets.zero,
                iconSize: 60, // Overall button size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
