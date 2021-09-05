import 'dart:ffi';

import 'package:odds_viewer/Helper/live_match.dart';

class Points {
  final String id;
  final List<PointsGroup>? data;
  final String type;
  final ChampionShip? championship;
  final int version;

  Points({
    required this.id,
    required this.data,
    required this.championship,
    required this.type,
    required this.version,
  });

  factory Points.fromJson(Map<String, dynamic> json) {
    return Points(
      id: json['_id'],
      data: List<PointsGroup>.from(json['data'].map((x) => PointsGroup.fromJson(x))),
      type: json['type'],
      championship: json['championship'] == null ? null : ChampionShip.fromJson(json['championship']),
      version: json['__v'],
    );
  }
}

class PointsGroup {
  final String id;
  final List<Team>? teams;

  PointsGroup({
    required this.id,
    required this.teams,
  });

  factory PointsGroup.fromJson(Map<String, dynamic> json) {
    return PointsGroup(
      id: json['_id'],
      teams: List<Team>.from(json['teams'].map((x) => Team.fromJson(x))),
    );
  }
}

class Team {
  final String name;
  final int matches;
  final int win;
  final int tied;
  final int nr;
  final int lost;
  final int points;
  final int nrr;

  Team({
    required this.name,
    required this.matches,
    required this.win,
    required this.tied,
    required this.nr,
    required this.lost,
    required this.points,
    required this.nrr,
});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      name: json['name'],
      matches: json['matches'],
      win: json['win'],
      tied: json['tied'],
      nr: json['nr'],
      lost: json['lost'],
      points: json['points'],
      nrr: json['nrr'],
    );
  }
}
