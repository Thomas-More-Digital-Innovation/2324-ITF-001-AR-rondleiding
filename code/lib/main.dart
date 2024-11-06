import 'package:flutter/material.dart';
import 'package:code/screens/HomePage.dart';

void main() {
  runApp(const ArRondleiding());
}

class ArRondleiding extends StatelessWidget {
  const ArRondleiding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AR Rondleiding',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF)
      ),
      home: const HomePage(),
    );
  }
}
