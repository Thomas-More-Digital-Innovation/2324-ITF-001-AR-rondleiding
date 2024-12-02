import 'package:code/components/Appbar.dart';
import 'package:flutter/material.dart';

import '../components/BottomTextTool.dart';

class CameraPage extends StatelessWidget {
  final int index;

  const CameraPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    String _text = 'something went wrong';

    String iceCube =
        "Het Startpunt Ondernemen van Thomas More is een inspirerend initiatief dat studenten ondersteunt bij het ontwikkelen van hun ondernemende vaardigheden en het realiseren van hun zakelijke ideeën. Dit programma biedt een breed scala aan mogelijkheden, van inspiratie en coaching tot evenementen en workshops, allemaal gericht op het stimuleren van ondernemerschap onder studenten."
        "Een van de belangrijkste aspecten van Startpunt Ondernemen is de inspiratie en coaching die studenten ontvangen. Door middel van diverse evenementen en workshops worden studenten aangemoedigd om hun dromen na te jagen en hun ideeën om te zetten in realiteit. Ervaren coaches staan klaar om hen te begeleiden bij elke stap van het proces, van het verfijnen van hun concept tot het opzetten van een volwaardige start-up."
        "Daarnaast organiseert Startpunt Ondernemen jaarlijks de Nacht van de Ondernemende Student, een evenement waar studenten kunnen netwerken, ideeën uitwisselen en leren van succesvolle ondernemers. Dit evenement, samen met de regelmatige workshops over onderwerpen zoals marketing, financiën en productontwikkeling, biedt studenten de kennis en vaardigheden die ze nodig hebben om succesvol te zijn in de wereld van ondernemerschap."
        "Thomas More biedt ook specifieke faciliteiten en ondersteuning voor student-ondernemers. Het student-ondernemer statuut maakt het mogelijk voor studenten om hun studie te combineren met hun ondernemende activiteiten door middel van gewettigde afwezigheid voor vakken en examenspreiding. Bovendien stimuleert de ICE Cube community een innovatieve, creatieve en ondernemende mindset, waar studenten kunnen samenwerken en hun ideeën verder kunnen ontwikkelen."
        "Om studenten verder te inspireren, heeft Thomas More de Get Shit Done Podcast gelanceerd. In deze podcast worden verhalen van jonge ondernemers gedeeld en worden tips en tricks gegeven om zelf te beginnen met ondernemen."
        "Voor studenten die geïnteresseerd zijn in deelname aan Startpunt Ondernemen, is het eenvoudig om contact op te nemen met de coördinator, Kristien Denteneer, via e-mail (kristien.denteneer@thomasmore.be). Door deel te nemen aan de verschillende evenementen en workshops kunnen studenten hun ondernemende dromen waarmaken terwijl ze nog studeren."
        "Startpunt Ondernemen biedt een ondersteunende omgeving waar studenten kunnen leren, groeien en hun ideeën tot leven kunnen brengen. Het is de perfecte plek voor iedereen die zijn ondernemende ambities wil realiseren.";

    String cafetaria =
        "De cafetaria van Thomas More is een gezellige plek waar studenten en medewerkers samenkomen om te eten, te drinken en te ontspannen. Je vindt er een gevarieerd aanbod aan snacks, broodjes, warme maaltijden en dranken tegen betaalbare prijzen. Met ruime zitplaatsen en een ontspannen sfeer is het een ideale plek om even pauze te nemen of bij te praten met vrienden en collega's. Afhankelijk van de campus kunnen openingstijden en aanbod variëren, dus check de info van jouw locatie voor actuele details!";

    if (index == 1) {
      _text = iceCube;
    } else if (index == 2) {
      _text = cafetaria;
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
                    child: BottomTextTool(text: _text),
                  ),
                ],
              ),
      ),
    );
  }
}
