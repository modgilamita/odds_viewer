import 'dart:convert';

class LiveMatch {
  final String status;
  final dynamic innings;
  final dynamic marketRate;
  final dynamic session;
  final dynamic lambi;
  final dynamic bookmarker;
  final dynamic scores;
  final String id;
  final ChampionShip? championShip;
  final Team? teamA;
  final Team? teamB;
  final String startDate;
  final String utcStartDate;
  final String location;
  final String type;
  final String matchType;
  final String overPerInnings;
  final String matchNumber;
  final Info? info;

  LiveMatch({
    required this.status,
    required this.innings,
    required this.marketRate,
    required this.session,
    required this.lambi,
    required this.bookmarker,
    required this.scores,
    required this.id,
    required this.championShip,
    required this.teamA,
    required this.teamB,
    required this.startDate,
    required this.utcStartDate,
    required this.location,
    required this.type,
    required this.matchType,
    required this.overPerInnings,
    required this.matchNumber,
    required this.info,
  });

  factory LiveMatch.fromJson(Map<String, dynamic> json) {
    return LiveMatch(
      status: json['status'],
      innings: json['innings'],
      marketRate: json['marketRate'],
      session: json['session'],
      lambi: json['lambi'],
      bookmarker: json['bookmarker'],
      scores: json['scores'],
      id: json['_id'],
      championShip: ChampionShip.fromJson(json['_championShip']),
      teamA: Team.fromJson(json['teamA']),
      teamB: Team.fromJson(json['teamB']),
      startDate: json['startDate'],
      utcStartDate: json['utcStartDate'],
      location: json['location'],
      type: json['type'],
      matchType: json['matchType'],
      overPerInnings: json['overPerInnings'],
      matchNumber: json['matchNumber'],
      info: Info.fromJson(json['info']),
    );
  }
}

class Info {
  final String umpire;
  final String third;
  final String refree;
  final String avgFirst;
  final String avgSecond;
  final String avgTotal;
  final String avgTotalLowest;
  final String playingXIA;
  final String playingXIB;

  Info({
    required this.umpire,
    required this.third,
    required this.refree,
    required this.avgFirst,
    required this.avgSecond,
    required this.avgTotal,
    required this.avgTotalLowest,
    required this.playingXIA,
    required this.playingXIB,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      umpire: json['umpire'],
      third: json['third'],
      refree: json['refree'],
      avgFirst: json['avgFirst'],
      avgSecond: json['avgSecond'],
      avgTotal: json['avgTotal'],
      avgTotalLowest: json['avgTotalLowest'],
      playingXIA: json['playingXIA'],
      playingXIB: json['playingXIB'],
    );
  }
}

class Team {
  final String id;
  final String name;
  final String image;
  final String shortName;
  final String type;

  Team({
    required this.id,
    required this.name,
    required this.image,
    required this.shortName,
    required this.type,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      shortName: json['shortName'],
      type: json['type'],
    );
  }
}

class ChampionShip {
  final List<String> teams;
  final bool finished;
  final String id;
  final String name;
  final String image;
  final String startDate;
  final String location;
  final String type;

  ChampionShip({
    required this.teams,
    required this.finished,
    required this.id,
    required this.name,
    required this.image,
    required this.startDate,
    required this.location,
    required this.type,
  });

  factory ChampionShip.fromJson(Map<String, dynamic> json) {
    return ChampionShip(
      teams: json['teams'],
      finished: json['finished'],
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      startDate: json['startDate'],
      location: json['location'],
      type: json['type'],
    );
  }
}
