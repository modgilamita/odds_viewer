import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
class RecentMatches extends StatelessWidget {
  const RecentMatches ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Recent Matches",
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
        child: Text("Recent Matches are shown here",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: OVColor.textColor,
          ),

        ),
      ),
    );
  }
}