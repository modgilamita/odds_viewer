import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/live_match.dart';
import 'package:odds_viewer/Helper/network.dart';

class LiveMatches extends StatelessWidget {
  const LiveMatches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Live Score",
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
        child: Center(child: LiveMatchesUI(),),
      ),
    );
  }
}

class LiveMatchesUI extends StatelessWidget {
  const LiveMatchesUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LiveMatch>>(
        future: Network.shared.liveMatchesData("1"),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text(snapshot.error.toString());
          }
          else if (snapshot.hasData) {
            final liveMatches = snapshot.data as List<LiveMatch>;
            if (liveMatches!=null) {
              return drawList(liveMatches, context);
            }
            return Text("No data available");
          }
          else {
            return CircularProgressIndicator();
          }
        });
  }

  ListView drawList(List<LiveMatch> list, BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          final title = (item.teamA!.name! + "  vs  " + item.teamB!.name!);
          final startDate = DateFormat('dd MMM,yyyy hh:mm a').format(item.championShip!.startDate!);
          return Padding(padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(2),),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(title,
                  style: OVTextStyle.boldTitle(),),
              ),
              Text(startDate,
                style: OVTextStyle.normalTitle(),),
              Padding(padding: EdgeInsets.all(2),),
            ],
          ),
          );
    });
  }
}
