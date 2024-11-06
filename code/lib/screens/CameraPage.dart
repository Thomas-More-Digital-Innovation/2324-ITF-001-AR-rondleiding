import 'package:code/components/Appbar.dart';
import 'package:flutter/material.dart';

import '../components/BottomTextTool.dart';

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
      appBar: CustomAppBar(),
      body: const Center(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomTextTool(),
            ),
          ],
        )
      ),
    );
  }
}
