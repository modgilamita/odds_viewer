import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/list_cell_view.dart';
import 'package:odds_viewer/Helper/live_match.dart';
import 'package:odds_viewer/Helper/network.dart';
import 'package:odds_viewer/Helper/upoming_matches.dart';

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
    return FutureBuilder<List<OVMatch>>(
        future: Network.shared.liveMatchesData("1"),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text(snapshot.error.toString());
          }
          else if (snapshot.hasData) {
            final liveMatches = snapshot.data as List<OVMatch>;
            return liveMatches.isNotEmpty ? drawList(liveMatches, context) : Text("No record available");
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
          return Padding(padding: EdgeInsets.all(16),
          child: GestureDetector(
            child: ListCellView(match: item,),
            onTap: () {
              print("Click to team match");
            },
          ),
          );
    });
  }
}
