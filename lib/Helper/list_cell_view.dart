import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/network.dart';
import 'package:odds_viewer/Helper/upoming_matches.dart';

class ListCellView extends StatelessWidget {
  const ListCellView({Key? key, required this.match}) : super(key: key);
  final OVMatch match;

  @override
  Widget build(BuildContext context) {
    final _textStyle = TextStyle(
        fontSize: 14, fontWeight: FontWeight.normal, color: OVColor.textColor);
    final _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      color: Colors.black,
                      border: Border.all(color: Colors.black, width: 2),
                      image: DecorationImage(
                        image: NetworkImage(Network.shared.baseUrl +
                            'images/' +
                            match.teamA!.image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 70,
                    height: 70,
                  ),
                  Container(
                    width: _width / 4,
                    height: 36,
                    child: Text(
                      match.teamA!.name!,
                      style: _textStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Container(
                width: _width / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      championshipName(),
                      style: OVTextStyle.boldTitle(),
                    ),
                    Text(
                      match.matchNumber!,
                      style: _textStyle,
                    ),
                    Text(
                      DateFormat.yMMMEd().format(match.utcStartDate!.toLocal()),
                      style: _textStyle,
                    ),
                    Text(
                      DateFormat.jm().format(match.utcStartDate!.toLocal()),
                      style: _textStyle,
                    ),
                    Text(
                      match.location!,
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      matchStatus(),
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      color: Colors.black,
                      border: Border.all(color: Colors.black, width: 2),
                      image: DecorationImage(
                        image: NetworkImage(Network.shared.baseUrl +
                            'images/' +
                            match.teamB!.image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 70,
                    height: 70,
                  ),
                  Container(
                    width: _width / 4,
                    height: 36,
                    child: Text(
                      match.teamB!.name!,
                      style: _textStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: OVColor.textColor,
          ),
        ],
      ),
    );
  }

  String matchStatus() {
    return match.status == 'finished'
        ? match.winBy.toUpperCase()
        : (match.utcStartDate!.isAfter(DateTime.now())
            ? timeLeft()
            : 'Live now');
  }

  String timeLeft() {
    var timeString = 'left';
    final difference = match.utcStartDate!.difference(DateTime.now()).inMinutes;
    final minutes = (((difference % (24 * 60)) % 60));
    if (minutes > 0) {
      timeString = minutes.toString() + ' minutes ' + timeString;
    }
    final hours = (difference % (24 * 60)) ~/ 60;
    if (hours > 0) {
      timeString = hours.toString() + ' hours ' + timeString;
    }
    final days = difference ~/ (24 * 60);
    if (days > 0) {
      timeString = days.toString() + ' days ' + timeString;
    }
    return timeString;
  }

  String championshipName() {
    return (match.championShip is ChampionShip) ? match.championShip!.name : '';
  }
}

class TeamVsTeam extends StatelessWidget {
  const TeamVsTeam({Key? key, required this.match}) : super(key: key);
  final OVMatch match;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _textStyle = TextStyle(
        fontSize: 14, fontWeight: FontWeight.normal, color: OVColor.textColor);
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Colors.black,
                  border: Border.all(color: Colors.black, width: 2),
                  image: DecorationImage(
                    image: NetworkImage(Network.shared.baseUrl +
                        'images/' +
                        match.teamA!.image!),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                width: 80,
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(2),
              ),
              Container(
                width: _width / 4,
                height: 36,
                child: Text(
                  match.teamA!.name!,
                  style: _textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Container(
            width: 60,
            height: 60,
            // color: OVColor.textColor,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'VS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: OVColor.themeColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: OVColor.textColor,
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Colors.black,
                  border: Border.all(color: Colors.black, width: 2),
                  image: DecorationImage(
                    image: NetworkImage(Network.shared.baseUrl +
                        'images/' +
                        match.teamB!.image!),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                width: 80,
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(2),
              ),
              Container(
                width: _width / 4,
                height: 36,
                child: Text(
                  match.teamB!.name!,
                  style: _textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
