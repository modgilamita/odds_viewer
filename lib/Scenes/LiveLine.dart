import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/upoming_matches.dart';
import 'package:odds_viewer/Scenes/LiveInfo.dart';

class MatchLiveLine extends StatelessWidget {
  const MatchLiveLine(
      {Key? key,
      required this.ballInfo,
      required this.currentOver,
      required this.match})
      : super(key: key);
  final TOver currentOver;
  final String ballInfo;
  final OVMatch match;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              match.teamA!.name! + ' vs ' + match.teamB!.name!,
              style: OVTextStyle.normalTitle(),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            color: OVColor.bg2Color,
            child: Text(
              match.winBy.toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.red),
              textAlign: TextAlign.center,
            ),
            height: match.status == 'finished' ? 30 : 0.0,
          ),
          LiveInfo(
            match: match,
            ballInfo: ballInfo,
            currentOver: currentOver,
          ),
        ],
      ),
    );
  }
}
