import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  final int index;

  const CameraPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {

    String name = '';

    if (index == 0) {
      name = 'Camera';
    } else if (index == 1) {
      name = 'ICE CUBE';
    } else if (index == 2) {
      name = 'LUNCH RUIMTE';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page for Button $index'),
      ),
      body: Center(
        child: Text(
          name,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
