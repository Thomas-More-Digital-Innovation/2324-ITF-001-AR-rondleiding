import 'package:flutter/material.dart';

class BottomTextTool extends StatefulWidget {
  final String text;
  final String expandableText;

  const BottomTextTool({super.key, required this.text, required this.expandableText});

  @override
  _BottomTextToolState createState() => _BottomTextToolState();
}

class _BottomTextToolState extends State<BottomTextTool>
    with SingleTickerProviderStateMixin {
  double _height = 150.0; // Initial height
  double _maxHeight = 700.0; // Maximum height when fully pulled up
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation =
    Tween<double>(begin: _height, end: _maxHeight).animate(_controller)
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
                      padding: const EdgeInsets.all(
                          30), // Larger padding for the outer circle
                      decoration: const BoxDecoration(
                        color: Color(0xFF0A2B45),
                        shape: BoxShape.circle,
                      ),
                    ),
                    // Inner white circle (slightly smaller)
                    Container(
                      padding: const EdgeInsets.all(
                          20), // Smaller padding for the inner circle
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
                      _isExpanded ? widget.text : widget.expandableText,
                      style:
                      const TextStyle(fontSize: 16.0, color: Colors.white),
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