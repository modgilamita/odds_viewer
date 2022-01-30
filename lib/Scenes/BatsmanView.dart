import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/upoming_matches.dart';

class BatsmanView extends StatelessWidget {
  const BatsmanView({Key? key, required this.batsman}) : super(key: key);
  final LastBatsmanOut batsman;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          child: Text(
            batsman.name! + (batsman.isOnStrike ? '*' : ''),
            style: TextStyle(
                color: OVColor.textColor,
                fontSize: 14,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          width: screenWidth / 4,
        ),
        Spacer(
          flex: 1,
        ),
        Container(
          child: Text(
            batsman.batsmanRuns.toString(),
            style: TextStyle(
                color: OVColor.textColor,
                fontSize: 14,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          width: screenWidth / 12,
        ),
        Spacer(
          flex: 1,
        ),
        Container(
          child: Text(
            batsman.balls.toString(),
            style: TextStyle(
                color: OVColor.textColor,
                fontSize: 14,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          width: screenWidth / 12,
        ),
        Spacer(
          flex: 1,
        ),
        Container(
          child: Text(
            batsman.fours.toString(),
            style: TextStyle(
                color: OVColor.textColor,
                fontSize: 14,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          width: screenWidth / 12,
        ),
        Spacer(
          flex: 1,
        ),
        Container(
          child: Text(
            batsman.sixes.toString(),
            style: TextStyle(
                color: OVColor.textColor,
                fontSize: 14,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          width: screenWidth / 12,
        ),
        Spacer(
          flex: 1,
        ),
        Container(
          child: Text(
            batsman.strikeRate.toString(),
            style: TextStyle(
                color: OVColor.textColor,
                fontSize: 14,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          width: screenWidth / 10,
        ),
        Spacer(
          flex: 1,
        )
      ],
    );
  }
}
