import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/live_match.dart';
import 'package:odds_viewer/Helper/network.dart';

class LiveScore extends StatelessWidget {
  const LiveScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Live Score",
        style: TextStyle(
          color: OVColor.textColor,
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
        ),
        iconTheme: IconThemeData(
          color: OVColor.textColor),
        backgroundColor: OVColor.themeColor,
        ),
      body: Center(
        child: Center(child: LiveScoreUI(),),
      ),
    );
  }
}

class LiveScoreUI extends StatelessWidget {
  const LiveScoreUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LiveMatch>>(
        future: Network.shared.liveMatchesData("1"),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text(snapshot.error.toString());
          }
          else if (snapshot.hasData) {
            return Text(snapshot.data![0].championShip!.name);
          }
          else {
            return CircularProgressIndicator();
          }
        });
  }
}
