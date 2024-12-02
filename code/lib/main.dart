import 'package:flutter/material.dart';
import 'package:code/screens/HomePage.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
          scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
      home: const HomePage(),
    );
  }
}
