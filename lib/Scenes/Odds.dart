import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/upoming_matches.dart';

class OddsForCurrentMatch extends StatelessWidget {
  const OddsForCurrentMatch(
      {Key? key,
      required this.marketRates,
      required this.bookmarkers,
      required this.session})
      : super(key: key);

  final List<MarketRate> marketRates;
  final List<MarketRate> bookmarkers;
  final List<Session> session;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            color: OVColor.textColor,
            child: _headerView(screenWidth, "Market Rate", "Back", "Lay")),
        ListView.builder(
            itemCount: marketRates.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _rateCell(screenWidth, marketRates[index]),
                  Divider(
                    color: OVColor.textColor,
                    height: 1,
                  )
                ],
              );
            }),
        Container(
            color: OVColor.textColor,
            child: _headerView(screenWidth, "Bookmarker Rate", "Back", "Lay")),
        ListView.builder(
            itemCount: bookmarkers.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _rateCell(screenWidth, bookmarkers[index]),
                  Divider(
                    color: OVColor.textColor,
                    height: 1,
                  )
                ],
              );
            }),
        Container(
            color: OVColor.textColor,
            child: _headerView(screenWidth, "Fancy", "No", "Yes")),
        ListView.builder(
            itemCount: session.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _sessionCell(screenWidth, session[index]),
                  Divider(
                    color: OVColor.textColor,
                    height: 1,
                  )
                ],
              );
            }),
      ],
    );
  }

  _headerView(double screenWidth, String name, String title, String subTitle) {
    final _textStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: OVColor.themeColor,
    );
    return Row(
      // Title
      children: [
        Container(
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(name, style: _textStyle)),
            width: screenWidth / 2),
        Container(
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                title,
                style: _textStyle,
              )),
          width: screenWidth / 4,
        ),
        Container(
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                subTitle,
                style: _textStyle,
              )),
          width: screenWidth / 4,
        ),
      ],
    );
  }

  _rateCell(double screenWidth, MarketRate rate) {
    final _textStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: OVColor.textColor,
    );
    return Row(
      children: [
        Container(
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                rate.name,
                style: _textStyle,
              )),
          width: screenWidth / 2,
        ),
        Container(
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                rate.back.price.toString() + "\n" + rate.back.size.toString(),
                style: _textStyle,
              )),
          width: screenWidth / 4,
          color: OVColor.oddBackColor,
        ),
        Container(
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                rate.lay.price.toString() + "\n" + rate.lay.size.toString(),
                style: _textStyle,
              )),
          width: screenWidth / 4,
          color: OVColor.oddLayColor,
        ),
      ],
    );
  }

  _sessionCell(double screenWidth, Session session) {
    final _textStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: OVColor.textColor,
    );
    return Row(
      children: [
        Container(
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                session.name,
                style: _textStyle,
              )),
          width: screenWidth / 2,
        ),
        Container(
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                session.back.price.toString() +
                    "\n" +
                    session.back.size.toString(),
                style: _textStyle,
              )),
          width: screenWidth / 4,
          color: OVColor.oddLayColor,
        ),
        Container(
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                session.lay.price.toString() +
                    "\n" +
                    session.lay.size.toString(),
                style: _textStyle,
              )),
          width: screenWidth / 4,
          color: OVColor.oddBackColor,
        ),
      ],
    );
  }
}
