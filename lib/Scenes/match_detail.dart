import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/upoming_matches.dart';

class MatchDetailScene extends StatefulWidget {
  const MatchDetailScene({Key? key, required this.match}) : super(key: key);

  final OVMatch match;
  @override
  _MatchDetailSceneState createState() => _MatchDetailSceneState();
}

class _MatchDetailSceneState extends State<MatchDetailScene> {

  int _selectedSegmentedIndex = 0;
  Map<int, Widget> _children = {
    0: Text('MATCH INFO'),
    1: Text('LIVE LINE'),
    2: Text('SCOREBOARD'),
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialSegmentedControl(
            children: _children,
            selectionIndex: _selectedSegmentedIndex,
            borderColor: Colors.grey,
            selectedColor: OVColor.textColor,
            unselectedColor: OVColor.themeColor,
            borderRadius: 8.0,
            onSegmentChosen: (int index) {
              setState(() {
                _selectedSegmentedIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}


