import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: OVColor.textColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
        child: Row(
          children: [
            Container(
              child: Text(
                '  Batsman',
                style: TextStyle(
                    color: OVColor.themeColor,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.left,
              ),
              width: screenWidth / 4,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Text(
                'Runs',
                style: TextStyle(
                    color: OVColor.themeColor,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              width: screenWidth / 12,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Text(
                'Balls',
                style: TextStyle(
                    color: OVColor.themeColor,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              width: screenWidth / 12,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Text(
                '4s',
                style: TextStyle(
                    color: OVColor.themeColor,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              width: screenWidth / 12,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Text(
                '6s',
                style: TextStyle(
                    color: OVColor.themeColor,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              width: screenWidth / 12,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Text(
                'SR',
                style: TextStyle(
                    color: OVColor.themeColor,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              width: screenWidth / 12,
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
