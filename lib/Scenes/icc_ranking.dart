import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/icc_ranking_model.dart';
import 'package:odds_viewer/Helper/network.dart';
class IccRanking extends StatelessWidget {
  const IccRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Icc Ranking",
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
      body: ICCRankingUI(),
    );
  }
}

class ICCRankingUI extends StatelessWidget {
  const ICCRankingUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Ranking>(
      future: Network.shared.iccRankingData(),
        builder: (context, snapshot) {
      if (snapshot.hasData) {
        print(snapshot.data!.id);
        return Center(child: Text(snapshot.data.toString()),);
      }
      else if (snapshot.hasError) {
        return Center(child: Text(snapshot.error.toString()),);
      }
      else {
        return Center(child: CircularProgressIndicator(),);
      }
    });
  }
}
