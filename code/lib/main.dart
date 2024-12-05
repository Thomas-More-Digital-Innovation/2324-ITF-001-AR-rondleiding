import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:code/screens/HomePage.dart';
import 'package:code/StateManager/language_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Get the device locale to initialize the language provider
  final Locale deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;

  runApp(ArRondleiding(deviceLocale: deviceLocale));
}

class ArRondleiding extends StatelessWidget {
  final Locale deviceLocale;

  const ArRondleiding({super.key, required this.deviceLocale});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LanguageProvider(deviceLocale),
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, _) {
          return MaterialApp(
            title: 'AR Rondleiding',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: const Color(0xFFFFFFFF),
            ),
            locale: Locale(languageProvider.currentLanguage == 'Dutch' ? 'nl' : 'en'),
            supportedLocales: const [
              Locale('en'),
              Locale('nl'),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
