import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/list_cell_view.dart';
import 'package:odds_viewer/Helper/network.dart';
import 'package:odds_viewer/Helper/upoming_matches.dart';

class UpcomingMatches extends StatelessWidget {
  const UpcomingMatches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upcoming Matches",
          style: TextStyle(
            color: OVColor.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        iconTheme: IconThemeData(color: OVColor.textColor),
        backgroundColor: OVColor.themeColor,
      ),
      body: Center(
        child: UpcomingMatchesUi(),
      ),
    );
  }
}

class UpcomingMatchesUi extends StatelessWidget {
  const UpcomingMatchesUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Docs>(
      future: Network.shared.upcomingMatchesData('1'),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          final upcomingMatches = snapshot.data!.docs as List<OVMatch>;
          return upcomingMatches.isNotEmpty ? drawList(upcomingMatches, context) : Text('No record found');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  ListView drawList(List<OVMatch> list, BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          return Padding(
            padding: EdgeInsets.all(16),
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
