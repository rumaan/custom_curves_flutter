import 'package:flutter/material.dart';

void main() => runApp(AppPage());

class AppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppPage();
}

class _AppPage extends State<AppPage> {
  double _dx = 0.5;
  double _dy = 0.5;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Shapes')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CustomPaint(
                painter: CustomShape(_dx, _dy),
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
        ),
      ),
    );
  }
}

class Sliders extends StatefulWidget {
  final ValueChanged<double> onChangeX;
  final ValueChanged<double> onChangeY;

  Sliders({this.onChangeX, this.onChangeY});

  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  double _valueX = 0.5;
  double _valueY = 0.5;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text('Control Point dX:', style: TextStyle(color: Colors.white)),
            Slider(
              onChanged: (valueX) {
                setState(() {
                  _valueX = valueX;
                });
                widget.onChangeX(valueX);
              },
              max: 1.0,
              min: 0.0,
              divisions: 10,
              value: _valueX,
              label: '$_valueX',
              activeColor: Colors.white,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text('Control Point dY:', style: TextStyle(color: Colors.white)),
            Slider(
              onChanged: (valueY) {
                setState(() {
                  _valueY = valueY;
                });
                widget.onChangeY(valueY);
              },
              max: 1.0,
              min: 0.0,
              divisions: 10,
              label: '$_valueY',
              value: _valueY,
              activeColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}

class CustomShape extends CustomPainter {
  final double _dx, _dy;

  CustomShape(this._dx, this._dy);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Draw a black background rectangle
    Rect backgroundRect = Rect.fromLTWH(0, 0, size.width, size.height);
    paint.color = Colors.black45;
    canvas.drawRect(backgroundRect, paint);

    // Trianle
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);

    var controlPoints = Offset(size.width * _dx, size.height * _dy);
    path.quadraticBezierTo(controlPoints.dx, controlPoints.dy, 0, 0);

    paint.color = Colors.deepOrange;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
