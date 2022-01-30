import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/models.dart';

class PlayerListCell extends StatelessWidget {
  const PlayerListCell(
      {Key? key, required this.model, required this.buildContext})
      : super(key: key);
  final PlayerModel model;
  final BuildContext buildContext;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(buildContext).size.width;
    final _texStyle = TextStyle(
        fontWeight: FontWeight.normal, fontSize: 14, color: OVColor.textColor);
    return Container(
      color: model.color,
      child: Padding(
        padding: EdgeInsets.fromLTRB(4, 6, 4, 6),
        child: Row(
          children: [
            model.outBy == null
                ? Container(
                    child: Text(
                      model.column1,
                      style: _texStyle,
                      textAlign: TextAlign.left,
                    ),
                    width: screenWidth / 3,
                  )
                : Container(
                    width: screenWidth / 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            model.column1,
                            style: _texStyle,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Container(
                          child: Text(
                            'b ' + model.outBy!,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.amber),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Text(
                model.column2,
                style: _texStyle,
                textAlign: TextAlign.center,
              ),
              width: screenWidth / 14,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Text(
                model.column3,
                style: _texStyle,
                textAlign: TextAlign.center,
              ),
              width: screenWidth / 14,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Text(
                model.column4,
                style: _texStyle,
                textAlign: TextAlign.center,
              ),
              width: screenWidth / 14,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Text(
                model.column5,
                style: _texStyle,
                textAlign: TextAlign.center,
              ),
              width: screenWidth / 14,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Text(
                model.column6,
                style: _texStyle,
                textAlign: TextAlign.center,
              ),
              width: screenWidth / 9,
            ),
          ],
        ),
      ),
    );
  }
}
