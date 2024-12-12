import 'package:code/components/Appbar.dart';
import 'package:flutter/material.dart';

import '../components/BottomTextTool.dart';

class CameraPage extends StatelessWidget {
  final int index;

  const CameraPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {

    const String iceCubeDutch =
        "Het Startpunt Ondernemen van Thomas More is een inspirerend initiatief dat studenten ondersteunt bij het ontwikkelen van hun ondernemende vaardigheden en het realiseren van hun zakelijke ideeën. Dit programma biedt een breed scala aan mogelijkheden, van inspiratie en coaching tot evenementen en workshops, allemaal gericht op het stimuleren van ondernemerschap onder studenten.";
    const String iceCubeEnglish =
        "De cafetaria van Thomas More is een gezellige plek waar studenten en medewerkers samenkomen om te eten, te drinken en te ontspannen. Je vindt er een gevarieerd aanbod aan snacks, broodjes, warme maaltijden en dranken tegen betaalbare prijzen. Met ruime zitplaatsen en een ontspannen sfeer is het een ideale plek om even pauze te nemen of bij te praten met vrienden en collega's.";

    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: index == 0 ?
        const Text('camera') :
        Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomTextTool(text: index == 1 ? iceCubeDutch : index == 2 ? iceCubeEnglish : ''),
            ),
          ],
        )
      ),
    );
  }
}
