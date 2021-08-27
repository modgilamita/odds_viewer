import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
class PointTable extends StatelessWidget {
  const PointTable ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Point Table",
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
        child: Text("This is Point Table Page",
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