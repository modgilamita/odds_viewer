import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/list_cell_view.dart';
import 'package:odds_viewer/Helper/upoming_matches.dart';
import 'package:odds_viewer/Scenes/MatchRow.dart';

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
