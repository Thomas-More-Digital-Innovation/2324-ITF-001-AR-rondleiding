import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../StateManager/language_provider.dart';
import '../components/Appbar.dart';
import '../components/BottomTextTool.dart';

class CameraPage extends StatelessWidget {
  final int index;

  const CameraPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // Access the current language from the LanguageProvider
    final languageProvider = Provider.of<LanguageProvider>(context);
    final bool isDutch = languageProvider.currentLanguage == 'Dutch';

    // Define the texts in both Dutch and English
    const String iceCubeDutch =
        "Het Startpunt Ondernemen van Thomas More is een inspirerend initiatief dat studenten ondersteunt bij het ontwikkelen van hun ondernemende vaardigheden en het realiseren van hun zakelijke ideeën. Dit programma biedt een breed scala aan mogelijkheden, van inspiratie en coaching tot evenementen en workshops, allemaal gericht op het stimuleren van ondernemerschap onder studenten.";
    const String iceCubeEnglish =
        "Thomas More's Entrepreneurship Hub is an inspiring initiative that supports students in developing their entrepreneurial skills and realizing their business ideas. This program offers a wide range of opportunities, from inspiration and coaching to events and workshops, all aimed at promoting entrepreneurship among students.";

    const String cafeteriaDutch =
        "De cafetaria van Thomas More is een gezellige plek waar studenten en medewerkers samenkomen om te eten, te drinken en te ontspannen. Je vindt er een gevarieerd aanbod aan snacks, broodjes, warme maaltijden en dranken tegen betaalbare prijzen. Met ruime zitplaatsen en een ontspannen sfeer is het een ideale plek om even pauze te nemen of bij te praten met vrienden en collega's.";
    const String cafeteriaEnglish =
        "Thomas More's cafeteria is a cozy spot where students and staff gather to eat, drink, and relax. You'll find a varied selection of snacks, sandwiches, hot meals, and drinks at affordable prices. With ample seating and a relaxed atmosphere, it’s an ideal place to take a break or catch up with friends and colleagues.";

    // Determine the appropriate text to display based on index and language
    String displayText = 'Something went wrong';
    if (index == 1) {
      displayText = isDutch ? iceCubeDutch : iceCubeEnglish;
    } else if (index == 2) {
      displayText = isDutch ? cafeteriaDutch : cafeteriaEnglish;
    }

    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: index == 0
            ? const Text('Camera')
            : Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomTextTool(text: displayText),
            ),
          ],
        ),
      ),
    );
  }
}
