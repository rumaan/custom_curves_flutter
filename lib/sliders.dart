import 'package:flutter/material.dart';

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
              value: _valueX,
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
              value: _valueY,
              activeColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}
