import 'package:flutter/material.dart';
import '../components/BottomNavigationHome.dart';
import '../components/PositionedButton.dart';
import '../components/language_selector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedLanguage = 'Dutch';

  void _onLanguageChanged(String newLanguage) {
    setState(() {
      _selectedLanguage = newLanguage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main interactive viewer with the image and positioned buttons
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: InteractiveViewer(
              minScale: 0.1,
              maxScale: 2.0,
              constrained: false,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/grondplan_rondleiding_groot.jpg',
                    fit: BoxFit.fitHeight,
                    height: MediaQuery.of(context).size.height * 0.90,
                  ),
                  // Custom positioned buttons
                  PositionedButton(
                    id: 1,
                    x: 140,
                    y: 200,
                    name: 'ICE cube',
                    language: _selectedLanguage,
                  ),
                  PositionedButton(
                    id: 2,
                    x: 850,
                    y: 240,
                    name: 'Lunch ruimte',
                    language: _selectedLanguage,
                  ),
                ],
              ),
            ),
          ),
          // Language selector in the top right corner
          LanguageSelector(selectedLanguage: _selectedLanguage,
            onLanguageChanged: _onLanguageChanged,),
          // Overlay positioned at the bottom with a camera button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigationHome(language: _selectedLanguage),
          ),
        ],
      ),
    );
  }
}