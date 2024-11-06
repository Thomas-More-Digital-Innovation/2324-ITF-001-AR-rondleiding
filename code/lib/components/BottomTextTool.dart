import 'package:flutter/material.dart';

class BottomTextTool extends StatefulWidget {
  const BottomTextTool({super.key});

  @override
  _BottomTextToolState createState() => _BottomTextToolState();
}

class _BottomTextToolState extends State<BottomTextTool>
    with SingleTickerProviderStateMixin {
  double _height = 100.0; // Initial height
  double _maxHeight = 400.0; // Maximum height when fully pulled up
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  final String _fullText =
      "This is the full content that will be displayed when the card is fully pulled up. "
      "You can add as much text here as you want. If the text exceeds the max height, "
      "it will be scrollable.";

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
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
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
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                width: 40,
                height: 40,
                child: const Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _isExpanded ? _fullText : "Pull up to read more...",
                      style: const TextStyle(fontSize: 16.0),
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
