import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.deepOrangeAccent,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Shapes')),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomPaint(
            painter: CustomShape(),
            child: Container(height: 700),
          ),
        ),
      ),
    );
  }
}

class CustomShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..isAntiAlias = true
      ..color = Colors.deepOrange;

    // Background rectangle
    var backgroundRect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(backgroundRect, paint);

    // White circle
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.5),
      50.0,
      paint,
    ); 
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != null;
}
