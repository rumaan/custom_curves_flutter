import 'package:custom_shapes/sliders.dart';
import 'package:flutter/material.dart';

class CurvesPage extends StatefulWidget {
  @override
  _CurvesPageState createState() => _CurvesPageState();
}

class _CurvesPageState extends State<CurvesPage> {
  double _dx = 0.5;
  double _dy = 0.5;

  @override
  Widget build(BuildContext context) {
    return _curves();
  }

  Widget _curves() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomPaint(
            painter: CustomCurvesPaint(_dx, _dy),
            child: Container(
              height: 600,
            ),
          ),
          Sliders(
            onChangeX: (dx) {
              setState(() {
                _dx = dx;
              });
            },
            onChangeY: (dy) {
              setState(() {
                _dy = dy;
              });
            },
          ),
        ],
      ),
    );
  }
}

class CustomCurvesPaint extends CustomPainter {
  final double _dx, _dy;

  CustomCurvesPaint(this._dx, this._dy);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..isAntiAlias = true;

    // Draw a black background rectangle
    final backgroundRect = Rect.fromLTWH(0, 0, size.width, size.height);
    paint.color = Colors.black45;
    canvas.drawRect(backgroundRect, paint);

    // Bézier curve
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);

    final controlPoints = Offset(size.width * _dx, size.height * _dy);
    path.quadraticBezierTo(controlPoints.dx, controlPoints.dy, 0, 0);

    paint.color = Colors.deepOrange;
    canvas.drawPath(path, paint);

    // Control Point circle
    paint.color = Colors.white;
    canvas.drawCircle(controlPoints, 5.5, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
