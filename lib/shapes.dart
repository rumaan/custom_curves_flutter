import 'package:flutter/material.dart';

class ShapesPage extends StatefulWidget {
  @override
  _ShapesPageState createState() => _ShapesPageState();
}

class _ShapesPageState extends State<ShapesPage> {
  @override
  Widget build(BuildContext context) {
    return _shapes();
  }

  Widget _shapes() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: CustomPaint(
              child: Container(width: double.infinity),
              painter: Shapes(),
            ),
          ),
        ],
      ),
    );
  }
}

class Shapes extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..isAntiAlias = true
      ..color = Colors.deepOrange;

    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.5),
      10.0,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
