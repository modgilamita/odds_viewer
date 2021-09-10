
import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/pointTable.dart';

class PointListTable extends StatefulWidget {
  const PointListTable({Key? key, required this.pointTable}) : super(key: key);
  final Points pointTable;

  @override
  _PointListTableState createState() => _PointListTableState();
}

class _PointListTableState extends State<PointListTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.pointTable.championship!.name!,
        style: TextStyle(
          color: OVColor.textColor,
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
      iconTheme: IconThemeData(color: OVColor.textColor),
      backgroundColor: OVColor.themeColor,
      ),
      body: ListTableUI(pointTable: widget.pointTable,),
    );
  }
}

class ListTableUI extends StatelessWidget {
  const ListTableUI({Key? key, required this.pointTable}) : super(key: key);

  final Points pointTable;
  @override
  Widget build(BuildContext context) {
    final teams = pointTable.data![0].teams;
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
          children: [Padding(padding: EdgeInsets.all(4)),
            Text(pointTable.data![0].name,
             style: OVTextStyle.boldTitle(),),
            Padding(padding: EdgeInsets.all(8)),
            PointsUICell(team: Team(name: 'Teams', matches: 'M', win: 'W', lost:
            'L', tied: 'T', nr: 'NR', points: 'Pts', nrr: 'NRR'), buildContext: context,),
            ListView.builder(
              itemCount: teams!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                final item = teams[index];
                return PointsUICell(team: item,
                  buildContext: context,);
            }),
          ],
        ),
    );
  }
}

class PointsUICell extends StatelessWidget {
  const PointsUICell({Key? key, required this.team, required this.buildContext}) : super(key: key);
  final Team team;
  final BuildContext buildContext;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(buildContext).size.width;
    return Row(
      children: [
        Container(child: Text(team.name,
          style: OVTextStyle.normalTitle(),
          textAlign: TextAlign.center,),
          width: screenWidth/6,),
        Spacer(flex: 1,),
        Container(child: Text(team.matches,
          style: OVTextStyle.normalTitle(),
          textAlign: TextAlign.center,),
          width: screenWidth/12,),
        Spacer(flex: 1,),
        Container(child: Text(team.win,
          style: OVTextStyle.normalTitle(),
          textAlign: TextAlign.center,),
          width: screenWidth/12,),
        Spacer(flex: 1,),
        Container(child: Text(team.lost,
          style: OVTextStyle.normalTitle(),
          textAlign: TextAlign.center,),
          width: screenWidth/12,),
        Spacer(flex: 1,),
        Container(child: Text(team.tied,
          style: OVTextStyle.normalTitle(),
          textAlign: TextAlign.center,),
          width: screenWidth/12,),
        Spacer(flex: 1,),
        Container(child: Text(team.nr,
          style: OVTextStyle.normalTitle(),
          textAlign: TextAlign.center,),
          width: screenWidth/12,),
        Spacer(flex: 1,),
        Container(child: Text(team.points,
          style: OVTextStyle.normalTitle(),
          textAlign: TextAlign.center,),
          width: screenWidth/12,),
        Spacer(flex: 1,),
        Container(child: Text(team.nrr,
          style: OVTextStyle.normalTitle(),
          textAlign: TextAlign.center,),
          width: screenWidth/8,),
        Spacer(flex: 1,),
      ],
    );
  }
}
