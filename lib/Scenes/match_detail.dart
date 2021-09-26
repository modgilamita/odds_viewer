import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/list_cell_view.dart';
import 'package:odds_viewer/Helper/models.dart';
import 'package:odds_viewer/Helper/upoming_matches.dart';

class MatchDetailScene extends StatefulWidget {
  const MatchDetailScene({Key? key, required this.match}) : super(key: key);

  final OVMatch match;
  @override
  _MatchDetailSceneState createState() => _MatchDetailSceneState();
}

class _MatchDetailSceneState extends State<MatchDetailScene> {
  int _selectedSegmentedIndex = 1;
  Map<int, Widget> _children = {
    0: Text(
      'MATCH INFO',
    ),
    1: Text('LIVE LINE'),
    2: Text('SCOREBOARD'),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Match Live Line",
          style: TextStyle(
            color: OVColor.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        iconTheme: IconThemeData(color: OVColor.textColor),
        backgroundColor: OVColor.themeColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(padding: EdgeInsets.all(8)),
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
          _buildUI(),
        ],
      ),
    );
  }

  _buildUI() {
    switch (_selectedSegmentedIndex) {
      case 0:
        return MatchInfo(match: widget.match);
      case 1:
        return MatchLiveLine(match: widget.match);
      case 2:
        return InningRecords(match: widget.match);
      default:
        return Text('No record found');
    }
  }
}

class MatchLiveLine extends StatelessWidget {
  const MatchLiveLine({Key? key, required this.match}) : super(key: key);
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
              match.winBy!.toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.red),
              textAlign: TextAlign.center,
            ),
            height: match.status == 'finished' ? 30 : 0.0,
          ),
          LiveInfo(match: match),
        ],
      ),
    );
  }
}

class MatchInfo extends StatelessWidget {
  const MatchInfo({Key? key, required this.match}) : super(key: key);
  final OVMatch match;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          shrinkWrap: true,
          children: [
            TeamVsTeam(match: match),
            Divider(
              color: OVColor.textColor,
            ),
            MatchRow(
                left: 'Series:',
                right: (match.championShip is ChampionShip)
                    ? (match.championShip as ChampionShip).name!
                    : '',
                bgColor: OVColor.bg1Color),
            MatchRow(
                left: 'Match:',
                right: match.teamA!.name! +
                    ' vs ' +
                    match.teamB!.name! +
                    ', ' +
                    match.matchNumber! +
                    ' Match',
                bgColor: OVColor.bg2Color),
            MatchRow(
                left: 'Date and time:',
                right:
                    DateFormat.yMMMEd().format(match.utcStartDate!.toLocal()) +
                        ' ' +
                        DateFormat.jm().format(match.utcStartDate!.toLocal()),
                bgColor: OVColor.bg1Color),
            MatchRow(
                left: 'Venue:',
                right: match.location!,
                bgColor: OVColor.bg2Color),
            MatchRow(left: 'Toss:', right: '', bgColor: OVColor.bg1Color),
            MatchRow(
                left: 'Umpire:',
                right: match.info!.umpire!,
                bgColor: OVColor.bg2Color),
            MatchRow(
                left: 'Third Umpire:',
                right: match.info!.third!,
                bgColor: OVColor.bg1Color),
            MatchRow(
                left: 'Match Refree:',
                right: match.info!.refree!,
                bgColor: OVColor.bg2Color),
            MatchRow(
                left: 'Avg. 1st inning score:',
                right: match.info!.avgFirst!,
                bgColor: OVColor.bg1Color),
            MatchRow(
                left: 'Avg. 1st inning score:',
                right: match.info!.avgSecond!,
                bgColor: OVColor.bg2Color),
            MatchRow(
                left: 'Highest Total:',
                right: match.info!.avgTotal!,
                bgColor: OVColor.bg1Color),
            MatchRow(
                left: 'Lowest Total:',
                right: match.info!.avgTotalLowest!,
                bgColor: OVColor.bg2Color),
            MatchRow(
                left: match.teamA!.name! + ' (Playing XI):',
                right: '',
                bgColor: OVColor.bg1Color),
            MatchRow(
                left: match.teamB!.name! + ' (Playing XI):',
                right: '',
                bgColor: OVColor.bg2Color),
          ],
        ),
      ),
    );
  }
}

class MatchRow extends StatelessWidget {
  const MatchRow(
      {Key? key,
      required this.left,
      required this.right,
      required this.bgColor})
      : super(key: key);
  final String left;
  final String right;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      color: bgColor,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: _width * (0.4),
              child: Text(left, style: OVTextStyle.normalTitle()),
            ),
            Container(
              width: _width * (0.5),
              child: Text(
                right,
                style: OVTextStyle.normalTitle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LiveInfo extends StatelessWidget {
  const LiveInfo({Key? key, required this.match}) : super(key: key);
  final OVMatch match;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _inning = match.innings.last;
    final _text = _inning.battingTeam.name! +
        ' ' +
        _inning.battingTeam.score!.toString() +
        '/' +
        _inning.battingTeam.wickets!.toString();
    return Column(
      children: [
        Row(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      _text,
                      style: OVTextStyle.normalTitle(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text('OVERS:' + _inning.battingTeam.overs.toString(),
                      style: OVTextStyle.normalTitle(),
                      textAlign: TextAlign.center),
                  Text('TARGET:' + _inning.battingTeam.target.toString(),
                      style: OVTextStyle.normalTitle(),
                      textAlign: TextAlign.center),
                  Text('CRR:' + _inning.battingTeam.runRate.toString(),
                      style: OVTextStyle.normalTitle(),
                      textAlign: TextAlign.center),
                ],
              ),
              width: _width * 0.6,
            ),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              padding: EdgeInsets.all(6),
              dashPattern: [8, 4],
              color: Colors.deepOrangeAccent,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Container(
                  child: FittedBox(
                    child: Text(
                      _inning.lastOver.balls.last.value == 'W'
                          ? _inning.lastOver.balls.last.type!.toUpperCase()
                          : _inning.lastOver.balls.last.value!.toUpperCase(),
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                          color: Colors.deepOrangeAccent),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  height: 60,
                  width: _width * 0.3,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(8),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Text(
                'Current Over',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.deepOrangeAccent),
                textAlign: TextAlign.center,
              ),
              color: OVColor.bg2Color,
              height: 20,
            ),
            SizedBox(
              height: 46,
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: _inning.lastOver.balls.length,
                  itemBuilder: (context, index) {
                    final _ball = _inning.lastOver.balls[index];
                    print(_ball.value!);
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border:
                              Border.all(color: OVColor.textColor, width: 1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: FittedBox(
                            child: Text(_ball.value ?? ''),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              color: OVColor.bg2Color,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (_inning.battingTeam.requiredRuns ?? 0).toString() +
                          ' runs required in ' +
                          (_inning.battingTeam.balls).toString() +
                          'balls',
                      style: OVTextStyle.normalTitle(),
                    ),
                    Text(
                      'RRR: ' +
                          (_inning.battingTeam.requiredRunRate == null
                              ? '0.0'
                              : _inning.battingTeam.requiredRunRate.toString()),
                      style: OVTextStyle.normalTitle(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(4)),
            Container(
              color: OVColor.bg2Color,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Last Wicket:',
                      style: OVTextStyle.normalTitle(),
                    ),
                    Text(
                      _inning.lastBatsmanOut.name != null
                          ? _inning.lastBatsmanOut.name! +
                              ' ' +
                              _inning.lastBatsmanOut.batsmanRuns.toString() +
                              ' (' +
                              _inning.lastBatsmanOut.balls.toString() +
                              ') SR:' +
                              _inning.lastBatsmanOut.strikeRate.toString()
                          : '-',
                      style: OVTextStyle.normalTitle(),
                    ),
                  ],
                ),
              ),
            ),
            ListHeader(),
            ListView.builder(
              itemCount: _inning.batsmen.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return BatsmanView(batsman: _inning.batsmen[index]);
              },
            ),
            Container(
              color: OVColor.textColor,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '  Bowling',
                      style: TextStyle(
                          color: OVColor.themeColor,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Text(
                '  Bowler:       ' + _inning.currentOver.bowlerName,
                style: TextStyle(
                    color: OVColor.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.left,
              ),
              color: OVColor.themeColor,
            ),
          ],
        )
      ],
    );
  }
}

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

class ListHeader extends StatelessWidget {
  const ListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: OVColor.textColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
        child: Row(
          children: [
            Container(
              child: Text(
                '  Batsman',
                style: TextStyle(
                    color: OVColor.themeColor,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.left,
              ),
              width: screenWidth / 4,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Text(
                'Runs',
                style: TextStyle(
                    color: OVColor.themeColor,
                    fontSize: 12,
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
                'Balls',
                style: TextStyle(
                    color: OVColor.themeColor,
                    fontSize: 12,
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
                '4s',
                style: TextStyle(
                    color: OVColor.themeColor,
                    fontSize: 12,
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
                '6s',
                style: TextStyle(
                    color: OVColor.themeColor,
                    fontSize: 12,
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
                'SR',
                style: TextStyle(
                    color: OVColor.themeColor,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              width: screenWidth / 12,
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}

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

class InningView extends StatelessWidget {
  const InningView({Key? key, required this.inning, required this.isNeedToShow})
      : super(key: key);
  final Inning inning;
  final bool isNeedToShow;

  @override
  Widget build(BuildContext context) {
    return isNeedToShow ? _children(context) : Container();
  }

  _children(BuildContext _context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                'Batting',
                style: OVTextStyle.normalTitle(),
              ),
            ),
          ),
          PlayerListCell(
              model: PlayerModel(
                color: Colors.amber,
                column1: 'Batsman',
                column2: 'R',
                column3: 'B',
                column4: '4s',
                column5: '6s',
                column6: 'SR',
                outBy: null,
              ),
              buildContext: _context),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: inning.wickets.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final _wicket = inning.wickets[index];
                final model = PlayerModel(
                    column1: _wicket.name!,
                    column2: _wicket.batsmanRuns.toString(),
                    column3: _wicket.balls.toString(),
                    column4: _wicket.fours.toString(),
                    column5: _wicket.sixes.toString(),
                    column6: _wicket.strikeRate.toString(),
                    outBy: _wicket.outBy,
                    color: OVColor.themeColor);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PlayerListCell(model: model, buildContext: _context),
                    Divider(
                      color: OVColor.textColor,
                    ),
                  ],
                );
              }),
          Container(
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                'Bowling',
                style: OVTextStyle.normalTitle(),
              ),
            ),
          ),
          PlayerListCell(
              model: PlayerModel(
                color: Colors.amber,
                column1: 'Bowler Name',
                column2: 'O',
                column3: 'M',
                column4: 'R',
                column5: 'W',
                column6: 'ER',
                outBy: null,
              ),
              buildContext: _context),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: inning.bowlers.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final _bowler = inning.bowlers[index];
                final model = PlayerModel(
                    column1: _bowler.name!,
                    column2: _bowler.overs.toString(),
                    column3: _bowler.maidens.toString(),
                    column4: _bowler.bowlerRuns.toString(),
                    column5: _bowler.wickets.toString(),
                    column6: _bowler.economy.toString(),
                    outBy: null,
                    color: OVColor.themeColor);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PlayerListCell(model: model, buildContext: _context),
                    Divider(
                      color: OVColor.textColor,
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}

class PlayerListCell extends StatelessWidget {
  const PlayerListCell(
      {Key? key, required this.model, required this.buildContext})
      : super(key: key);
  final PlayerModel model;
  final BuildContext buildContext;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(buildContext).size.width;
    final _texStyle = TextStyle(
        fontWeight: FontWeight.normal, fontSize: 14, color: OVColor.textColor);
    return Container(
      color: model.color,
      child: Padding(
        padding: EdgeInsets.fromLTRB(4, 6, 4, 6),
        child: Row(
          children: [
            model.outBy == null
                ? Container(
                    child: Text(
                      model.column1,
                      style: _texStyle,
                      textAlign: TextAlign.left,
                    ),
                    width: screenWidth / 3,
                  )
                : Container(
                    width: screenWidth / 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            model.column1,
                            style: _texStyle,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Container(
                          child: Text(
                            'b ' + model.outBy!,
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12, color: Colors.amber),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Text(
                model.column2,
                style: _texStyle,
                textAlign: TextAlign.center,
              ),
              width: screenWidth / 14,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Text(
                model.column3,
                style: _texStyle,
                textAlign: TextAlign.center,
              ),
              width: screenWidth / 14,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Text(
                model.column4,
                style: _texStyle,
                textAlign: TextAlign.center,
              ),
              width: screenWidth / 14,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Text(
                model.column5,
                style: _texStyle,
                textAlign: TextAlign.center,
              ),
              width: screenWidth / 14,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Text(
                model.column6,
                style: _texStyle,
                textAlign: TextAlign.center,
              ),
              width: screenWidth / 9,
            ),
          ],
        ),
      ),
    );
  }
}
