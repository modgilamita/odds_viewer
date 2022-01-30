import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/models.dart';
import 'package:odds_viewer/Helper/upoming_matches.dart';
import 'package:odds_viewer/Scenes/PlayerListCell.dart';

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
