import 'package:flutter/material.dart';
import 'package:odds_viewer/Scenes/landing_page.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
  super.initState();
  _navigatetohome();
  }
  _navigatetohome () async {
  await Future.delayed(Duration(milliseconds : 1500),() {} );
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => LandingPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
        child: Text("Odds Viewer",
          style: TextStyle(fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      ),
    );
  }
}
