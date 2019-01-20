import 'package:flutter/material.dart';
import 'package:planeta_x/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planeta X',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey, accentColor: Colors.blueAccent),
      home: Home(),
    );
  }
}
