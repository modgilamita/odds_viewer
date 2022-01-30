import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';

class MatchRow extends StatelessWidget {
  const MatchRow(
      {Key? key,
      required this.left,
      required this.right,
      required this.bgColor})
      : super(key: key);
  final String left;
  final String right;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      color: bgColor,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: _width * (0.4),
              child: Text(left, style: OVTextStyle.normalTitle()),
            ),
            Container(
              width: _width * (0.5),
              child: Text(
                right,
                style: OVTextStyle.normalTitle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
