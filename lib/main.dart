import './curves.dart';
import './shapes.dart';
import 'package:flutter/material.dart';

void main() => runApp(AppPage());

class AppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppPage();
}

class _AppPage extends State<AppPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepOrangeAccent),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Curves'),
          ),
          body: TabBarView(
            children: <Widget>[
              CurvesPage(),
              ShapesPage(),
            ],
          ),
        ),
      ),
    );
  }
}
