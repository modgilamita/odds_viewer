import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/icc_ranking_model.dart';
import 'package:odds_viewer/Helper/network.dart';

class IccRanking extends StatefulWidget {
  const IccRanking({Key? key}) : super(key: key);

  @override
  _IccRankingState createState() => _IccRankingState();
}

class _IccRankingState extends State<IccRanking> {
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
        return Center(child: Text(snapshot.data!.type.toUpperCase()),);
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


