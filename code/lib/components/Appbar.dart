// lib/custom_app_bar.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final VoidCallback? onReplay;

  CustomAppBar({this.onBack, this.onReplay});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF00283C),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF005783), width: 2, strokeAlign: BorderSide.strokeAlignOutside),
          ),
          padding: const EdgeInsets.all(8),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.orange,
            size: 24,
          ),
        ),
        onPressed: onBack ?? () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF00283C),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF005783), width: 2, strokeAlign: BorderSide.strokeAlignOutside),
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.replay,
              color: Colors.orange,
              size: 24,
            ),
          ),
          onPressed: onReplay,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
