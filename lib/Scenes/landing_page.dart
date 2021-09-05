import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Scenes/contact.dart';
import 'package:odds_viewer/Scenes/icc_ranking.dart';
import 'package:odds_viewer/Scenes/live_matches.dart';
import 'package:odds_viewer/Scenes/point_table.dart';
import 'package:odds_viewer/Scenes/recent_matches.dart';
import 'package:odds_viewer/Scenes/settings.dart';
import 'package:odds_viewer/Scenes/share.dart';
import 'package:odds_viewer/Scenes/upcoming_matches.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
        children: [
          // ==== Header View
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(12)),
                Image.asset(
                  OVAssets.logo,
                  fit: BoxFit.fill,
                  width: 100,
                  height: 100,
                ),
                Text(
                  "ODDS VIEWER",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: OVColor.textColor,
                  ),
                ),
                Padding(padding: EdgeInsets.all(16))
              ],
            ),
          ),

          // ===== Listing
          Card(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LiveMatches()))
                  },
                  child: CardView(
                      imageName: OVAssets.live,
                      title: "live Score",
                      subTitle: "All live matches"),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpcomingMatches()))
                  },
                  child: CardView(
                      imageName: OVAssets.upcoming,
                      title: "upcoming matches",
                      subTitle: "upcoming matches list"),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecentMatches()))
                  },
                  child: CardView(
                      imageName: OVAssets.cricket,
                      title: "Recent Matches",
                      subTitle: "View recent matches"),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => IccRanking()))
                  },
                  child: CardView(
                      imageName: OVAssets.iccRanking,
                      title: "icc ranking",
                      subTitle: "View ICC ranking"),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PointTable()))
                  },
                  child: CardView(
                      imageName: OVAssets.pointTable,
                      title: "Point Table",
                      subTitle: "View Point Table"),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsScene()))
                  },
                  child: CardView(
                      imageName: OVAssets.settings,
                      title: "Setting",
                      subTitle: "Manage App Setting"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactUs()),
                    );
                  },
                  child: CardView(
                      imageName: OVAssets.contact,
                      title: "Contact us",
                      subTitle: "Have any Question"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShareScene()),
                    );
                  },
                  child: CardView(
                      imageName: OVAssets.feedback,
                      title: "Share and feedback",
                      subTitle: "Share on social media"),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

class CardView extends StatelessWidget {
  const CardView(
      {Key? key,
      required this.imageName,
      required this.title,
      required this.subTitle})
      : super(key: key);

  final String imageName;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(8)),
          Row(
            children: [
              Image.asset(
                imageName,
                fit: BoxFit.fitWidth,
                width: 40,
              ),
              Padding(
                padding: EdgeInsets.all(8),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: OVColor.textColor,
                  ),
                ),
                Text(
                  subTitle.toString(),
                  style: TextStyle(color: OVColor.textColor),
                ),
              ])
            ],
          ),
          Padding(padding: EdgeInsets.all(8))
        ],
      ),
    );
  }
}
