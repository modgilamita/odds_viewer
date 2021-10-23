import 'dart:io';

import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/network.dart';
import 'package:odds_viewer/Scenes/landing_page.dart';
import 'package:odds_viewer/Scenes/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Socket.connect(Network.shared.baseUrl, 80).then((socket) => socket.emi);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
      ),
      home: LandingPage(),
    );
  }
}

