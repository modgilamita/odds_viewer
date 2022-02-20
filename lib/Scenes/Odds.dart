import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/upoming_matches.dart';

class OddsView extends StatelessWidget {
  const OddsView({Key? key, required this.marketRates}) : super(key: key);
  final List<MarketRate> marketRates;

  @override
  Widget build(BuildContext context) {
    marketRates.forEach((element) {
      print(element.name);
    });
    return Container(child: Text("Thiss is text"));
  }
}

class OddsForCurrentMatch extends StatelessWidget {
  const OddsForCurrentMatch(
      {Key? key, required this.marketRates, required this.bookmarkers})
      : super(key: key);

  final List<MarketRate> marketRates;
  final List<MarketRate> bookmarkers;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width - 16;
    print(marketRates.map((e) => print(e.name)));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            color: OVColor.textColor,
            child: Padding(
                padding: EdgeInsets.all(8),
                child: _headerView(screenWidth, "Market Rate", "Back", "Lay"))),
        ListView.builder(
            itemCount: marketRates.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _rateCell(screenWidth, marketRates[index]);
            }),
        Container(
            color: OVColor.textColor,
            child: Padding(
                padding: EdgeInsets.all(8),
                child: _headerView(
                    screenWidth, "Bookmarker Rate", "Back", "Lay"))),
        ListView.builder(
            itemCount: bookmarkers.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _rateCell(screenWidth, bookmarkers[index]);
            })
      ],
    );
  }

  _headerView(double screenWidth, String name, String title, String subTitle) {
    final _textStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    );
    return Row(
      // Title
      children: [
        Container(
          child: Text(name, style: _textStyle),
          width: screenWidth / 2,
        ),
        Container(
          child: Text(
            title,
            style: _textStyle,
          ),
          width: screenWidth / 4,
        ),
        Container(
          child: Text(
            subTitle,
            style: _textStyle,
          ),
          width: screenWidth / 4,
        ),
      ],
    );
  }

  _rateCell(double screenWidth, MarketRate rate) {
    final _textStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: OVColor.themeColor,
    );
    print(rate.name);
    return Row(
      children: [
        Container(
          child: Text(
            rate.name,
            style: TextStyle(color: Colors.black),
          ),
          width: screenWidth / 2,
        ),
        Container(
          child: Text(
            rate.back.toString(),
            style: TextStyle(color: Colors.black),
          ),
          width: screenWidth / 4,
        ),
        Container(
          child: Text(
            rate.lay.toString(),
            style: TextStyle(color: Colors.black),
          ),
          width: screenWidth / 4,
        ),
      ],
    );
  }
}
