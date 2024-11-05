import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page for Button $index'),
      ),
      body: Center(
        child: Text(
          'You pressed button $index',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
