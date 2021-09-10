class Ranking {
  final String id;
  final SkillType data;
  final String type;

  const Ranking({
    required this.id,
    required this.data,
    required this.type,
  });
  factory Ranking.fromJson(Map<String, dynamic> json) {
    return Ranking(
      id: json['_id'],
      data: SkillType.fromJson(json['data']),
      type: json['type'],
    );
  }
}

class SkillType {
  final Platform batting;
  final Platform bowling;
  final Platform team;
  final Platform all;

  const SkillType({
    required this.batting,
    required this.bowling,
    required this.team,
    required this.all});

  factory SkillType.fromJson(Map<String, dynamic> json) {
    return SkillType(
      batting: Platform.fromJson(json['batting']),
      bowling: Platform.fromJson(json['bowling']),
      team: Platform.fromJson(json['team']),
      all: Platform.fromJson(json['all']),
    );
  }
}

class Platform {
  final List<Player> odi;
  final List<Player> test;
  final List<Player> t20;

  const Platform({
    required this.odi,
    required this.test,
    required this.t20,
  });

  factory Platform.fromJson(Map<String, dynamic> json) {
    return Platform(
      odi: List<Player>.from(json["odi"].map((x) => Player.fromJson(x))),
      test: List<Player>.from(json["test"].map((x) => Player.fromJson(x))),
      t20: List<Player>.from(json["t"].map((x) => Player.fromJson(x))),
    );
  }
}

class Player {
  final String name;
  final String country;
  final String points;

  const Player({
    required this.name,
    required this.country,
    required this.points,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['name'],
      country: json['country'],
      points: json['points'],
    );
  }
}
