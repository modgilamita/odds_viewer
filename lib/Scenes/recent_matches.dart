import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/network.dart';
import 'package:odds_viewer/Helper/upoming_matches.dart';

class RecentMatches extends StatelessWidget {
  const RecentMatches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recent Matches",
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
        child: RecentMatchesUI(),
      ),
    );
  }

}

class RecentMatchesUI extends StatelessWidget {
  const RecentMatchesUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Docs>(
        future: Network.shared.recentMatchesData('1'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text(snapshot.error.toString());
          }
          else if (snapshot.hasData) {
            final recentMatches = snapshot.data!.docs as List<OVMatch>;
            return drawList(recentMatches, context);
          }
          else {
            return CircularProgressIndicator();
          }
        });
  }

  ListView drawList(List<OVMatch> list, BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          final title = (item.teamA!.name! + "  vs  " + item.teamB!.name!);
          final startDate = DateFormat('dd MMM,yyyy hh:mm a').format(item!.utcStartDate!);
          return Padding(padding: EdgeInsets.all(16),
            child: GestureDetector(
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
              onTap: () {
                print("Click to team match");
              },
            ),
          );
        });
  }
}