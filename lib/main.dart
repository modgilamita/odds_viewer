import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Scenes/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
      ),
      home: LandingPage(),
    );
  }
}

