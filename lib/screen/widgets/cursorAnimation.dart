import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CursorAnimation extends StatefulWidget {
  @override
  _CursorAnimationState createState() => _CursorAnimationState();
}

class _CursorAnimationState extends State<CursorAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
      reverseDuration: Duration(milliseconds: 200),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: MouseRegion(
        onHover: _onHover,
        child: Container(
          width: 2.0,
          height: 20.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.black,
          ),
          child: ScaleTransition(
            scale: CurvedAnimation(
              parent: _controller,
              curve: Curves.elasticInOut,
              reverseCurve: Curves.easeOut,
            ),
            child: Container(
              height: 2.0,
              width: 2.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onHover(PointerHoverEvent event) {
    if (event.kind == PointerDeviceKind.mouse) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
