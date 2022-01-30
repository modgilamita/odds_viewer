import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/upoming_matches.dart';
import 'package:odds_viewer/Scenes/InningsView.dart';

class InningRecords extends StatefulWidget {
  const InningRecords({Key? key, required this.match}) : super(key: key);

  final OVMatch match;

  @override
  _InningRecordsState createState() => _InningRecordsState();
}

class _InningRecordsState extends State<InningRecords> {
  bool _inning1Selected = true;
  bool _inning2Selected = false;
  @override
  Widget build(BuildContext context) {
    final _firstInning = widget.match.innings.first;
    final team1Title = _firstInning.battingTeam.name! +
        ' ' +
        _firstInning.battingTeam.score.toString() +
        '/' +
        _firstInning.battingTeam.wickets.toString() +
        '(' +
        _firstInning.battingTeam.overs.toString() +
        ' Overs)';
    final _secondInning = widget.match.innings.last;
    final team2Title = _secondInning.battingTeam.name! +
        ' ' +
        _secondInning.battingTeam.score.toString() +
        '/' +
        _secondInning.battingTeam.wickets.toString() +
        '(' +
        _secondInning.battingTeam.overs.toString() +
        ' Overs)';
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(padding: EdgeInsets.all(8)),
          GestureDetector(
            child: Container(
              color: OVColor.textColor,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  team1Title,
                  style: TextStyle(
                      color: OVColor.themeColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            onTap: () {
              setState(() {
                _inning1Selected = true;
                _inning2Selected = false;
              });
            },
          ),
          InningView(inning: _firstInning, isNeedToShow: _inning1Selected),
          GestureDetector(
            child: Container(
              color: OVColor.textColor,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  team2Title,
                  style: TextStyle(
                      color: OVColor.themeColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            onTap: () {
              setState(() {
                _inning2Selected = true;
                _inning1Selected = false;
              });
            },
          ),
          InningView(inning: _secondInning, isNeedToShow: _inning2Selected),
        ],
      ),
    );
  }
}
