import 'package:flutter/material.dart';

class BottomTextTool extends StatefulWidget {
  const BottomTextTool({super.key});

  @override
  _BottomTextToolState createState() => _BottomTextToolState();
}

class _BottomTextToolState extends State<BottomTextTool>
    with SingleTickerProviderStateMixin {
  double _height = 150.0; // Initial height
  double _maxHeight = 800.0; // Maximum height when fully pulled up
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  final String _fullText =
      "Het Startpunt Ondernemen van Thomas More is een inspirerend initiatief dat studenten ondersteunt bij het ontwikkelen van hun ondernemende vaardigheden en het realiseren van hun zakelijke ideeën. Dit programma biedt een breed scala aan mogelijkheden, van inspiratie en coaching tot evenementen en workshops, allemaal gericht op het stimuleren van ondernemerschap onder studenten."

  "Een van de belangrijkste aspecten van Startpunt Ondernemen is de inspiratie en coaching die studenten ontvangen. Door middel van diverse evenementen en workshops worden studenten aangemoedigd om hun dromen na te jagen en hun ideeën om te zetten in realiteit. Ervaren coaches staan klaar om hen te begeleiden bij elke stap van het proces, van het verfijnen van hun concept tot het opzetten van een volwaardige start-up."

  "Daarnaast organiseert Startpunt Ondernemen jaarlijks de Nacht van de Ondernemende Student, een evenement waar studenten kunnen netwerken, ideeën uitwisselen en leren van succesvolle ondernemers. Dit evenement, samen met de regelmatige workshops over onderwerpen zoals marketing, financiën en productontwikkeling, biedt studenten de kennis en vaardigheden die ze nodig hebben om succesvol te zijn in de wereld van ondernemerschap."

  "Thomas More biedt ook specifieke faciliteiten en ondersteuning voor student-ondernemers. Het student-ondernemer statuut maakt het mogelijk voor studenten om hun studie te combineren met hun ondernemende activiteiten door middel van gewettigde afwezigheid voor vakken en examenspreiding. Bovendien stimuleert de ICE Cube community een innovatieve, creatieve en ondernemende mindset, waar studenten kunnen samenwerken en hun ideeën verder kunnen ontwikkelen."

  "Om studenten verder te inspireren, heeft Thomas More de Get Shit Done Podcast gelanceerd. In deze podcast worden verhalen van jonge ondernemers gedeeld en worden tips en tricks gegeven om zelf te beginnen met ondernemen."

  "Voor studenten die geïnteresseerd zijn in deelname aan Startpunt Ondernemen, is het eenvoudig om contact op te nemen met de coördinator, Kristien Denteneer, via e-mail (kristien.denteneer@thomasmore.be). Door deel te nemen aan de verschillende evenementen en workshops kunnen studenten hun ondernemende dromen waarmaken terwijl ze nog studeren."

  "Startpunt Ondernemen biedt een ondersteunende omgeving waar studenten kunnen leren, groeien en hun ideeën tot leven kunnen brengen. Het is de perfecte plek voor iedereen die zijn ondernemende ambities wil realiseren.";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: _height, end: _maxHeight).animate(_controller)
      ..addListener(() {
        setState(() {
          _height = _animation.value;
        });
      });
  }

  void _toggleExpansion() {
    if (_isExpanded) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          setState(() {
            _height -= details.delta.dy;
            _height = _height.clamp(100.0, _maxHeight);
          });
        },
        onVerticalDragEnd: (details) {
          if (_height > _maxHeight / 2) {
            _controller.forward();
            setState(() => _isExpanded = true);
          } else {
            _controller.reverse();
            setState(() => _isExpanded = false);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _height,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF0A2B45),
            borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    // Outer dark blue circle (slightly bigger)
                    Container(
                      padding: const EdgeInsets.all(30), // Larger padding for the outer circle
                      decoration: const BoxDecoration(
                        color: Color(0xFF0A2B45),
                        shape: BoxShape.circle,
                      ),
                    ),
                    // Inner white circle (slightly smaller)
                    Container(
                      padding: const EdgeInsets.all(20), // Smaller padding for the inner circle
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    // Orange camera icon
                    const Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: Colors.orange,
                      size: 30, // Adjust icon size as needed
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _isExpanded ? _fullText : "Lees hier de tekst...",
                      style: const TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
