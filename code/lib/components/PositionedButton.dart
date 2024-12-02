import 'package:flutter/material.dart';
import 'package:code/screens/CameraPage.dart';

class PositionedButton extends StatelessWidget {
  final int id;
  final double x;
  final double y;
  final String name;

  const PositionedButton({
    super.key,
    required this.id,
    required this.x,
    required this.y,
    required this.name,
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
              builder: (context) => CameraPage(index: id),
            ),
          );
        },
        child: Text(name),
      ),
    );
  }
}
