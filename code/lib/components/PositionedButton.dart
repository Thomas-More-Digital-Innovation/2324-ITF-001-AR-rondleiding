import 'package:flutter/material.dart';
import 'package:code/screens/CameraPage.dart';

class PositionedButton extends StatelessWidget {
  final int index;
  final double x;
  final double y;

  const PositionedButton({
    super.key,
    required this.index,
    required this.x,
    required this.y,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(index: index),
            ),
          );
        },
        child: Text('Button $index'),
      ),
    );
  }
}