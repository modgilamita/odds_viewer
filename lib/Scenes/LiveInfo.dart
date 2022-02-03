import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/upoming_matches.dart';
import 'package:odds_viewer/Scenes/BatsmanView.dart';
import 'package:odds_viewer/Scenes/ListHeader.dart';

class LiveInfo extends StatelessWidget {
  const LiveInfo({Key? key, required this.match}) : super(key: key);
  final OVMatch match;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _inning = match.innings.last;
    print(_inning.lastOver.balls.map((e) => e.value));
    final _text = _inning.battingTeam.name! +
        ' ' +
        _inning.battingTeam.score.toString() +
        '/' +
        _inning.battingTeam.wickets.toString();
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
                      _inning.currentOver.balls.last.value == 'W'
                          ? _inning.currentOver.balls.last.type!.toUpperCase()
                          : _inning.currentOver.balls.last.value!.toUpperCase(),
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
                  itemCount: _inning.currentOver.balls.length,
                  itemBuilder: (context, index) {
                    final _ball = _inning.currentOver.balls[index];
                    final _ballString = _ballValue(_ball);
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
                            child: Text(_ballString),
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
                      (_inning.battingTeam.requiredRuns).toString() +
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

  String _ballValue(Ball ball) {
    switch (ball.type) {
      case "WIDE":
        return ball.value.toString() + "WD";
      case "NOBALL":
        return ball.value!.replaceAll("b", "") + "NB";
      case "WICKET":
        return ball.value.toString() + "W";
      case "LEGBYE":
        return ball.value.toString() + "L";
      case "BYE":
        return ball.value.toString() + "B";
      case "INFIELDBOUNDARY":
        return ball.value.toString();
      default:
        return "";
    }
  }
}
