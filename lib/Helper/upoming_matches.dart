import 'package:intl/intl.dart';

class Docs {
  final List<OVMatch> docs;
  const Docs({
    required this.docs,
  });

  factory Docs.fromJson(Map<String, dynamic> json) {
    return Docs(
        docs: List<OVMatch>.from(json["docs"].map((x) => OVMatch.fromJson(x))));
  }
}

class OVMatch {
  final String status;
  final List<Inning> innings;
  final dynamic marketRate;
  final dynamic session;
  final dynamic lambi;
  final dynamic bookmarker;
  final dynamic scores;
  final String id;
  final dynamic championShip;
  final Team? teamA;
  final Team? teamB;
  final String? startDate;
  final DateTime? utcStartDate;
  final String? location;
  final String? type;
  final String? matchType;
  final String? overPerInnings;
  final String? matchNumber;
  final Info? info;
  final String pausedDue;
  final String winBy;

  OVMatch({
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
    required this.pausedDue,
    required this.winBy,
  });

  factory OVMatch.fromJson(Map<String, dynamic> json) {
    return OVMatch(
      status: json['status'],
      innings: List<Inning>.from(
          json["innings"].map((x) => Inning.fromJson(x))),
      marketRate: json['marketRate'],
      session: json['session'],
      lambi: json['lambi'],
      bookmarker: json['bookmarker'],
      scores: json['scores'],
      id: json['_id'],
      championShip: (json['championShip'] is String)
          ? json['championShip']
          : ChampionShip.fromJson(json['championShip']),
      teamA: Team.fromJson(json['teamA']),
      teamB: Team.fromJson(json['teamB']),
      startDate: json['startDate'],
      utcStartDate:
          DateFormat('yyyy-MM-dd hh:mm:ss').parse(json['startDateUtc'], true),
      location: json['location'],
      type: json['type'],
      matchType: json['matchType'],
      overPerInnings: json['overPerInnings'],
      matchNumber: json['matchNumber'],
      info: Info.fromJson(json['info']),
      pausedDue: json['pausedDue'] == null ? "" : json['pausedDue'],
      winBy: json['winBy'] == null ? "" : json['winBy'],
    );
  }
}

class Info {
  final String? umpire;
  final String? third;
  final String? refree;
  final String? avgFirst;
  final String? avgSecond;
  final String? avgTotal;
  final String? avgTotalLowest;
  final String? playingXIA;
  final String? playingXIB;

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
  final String? id;
  final String? name;
  final String? image;
  final String? shortName;
  final String? type;

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
  final String? id;
  final String? name;
  final String? image;
  final DateTime? startDate;
  final String? location;
  final String? type;

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
      teams: List<String>.from(json['teams'].map((x) => x)),
      finished: json['finished'],
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      startDate: DateTime.parse(json['startDate']),
      location: json['location'],
      type: json['type'],
    );
  }
}

class Inning {
  Inning({
    required this.bowlers,
    required this.wickets,
    required this.extras,
    required this.wicketsInCount,
    required this.batsmen,
    required this.retired,
    required this.wicketfall,
    required this.finished,
    required this.oldCopie,
    required this.id,
    required this.battingTeam,
    required this.currentOver,
    required this.lastOver,
    required this.lastBatsmanOut,
    required this.remainingBalls,
    required this.bowler,
    required this.text,
    required this.matchId,
  });

  List<Bowler> bowlers;
  List<LastBatsmanOut> wickets;
  Extras extras;
  String? wicketsInCount;
  List<LastBatsmanOut> batsmen;
  List<dynamic> retired;
  List<dynamic> wicketfall;
  bool finished;
  List<dynamic> oldCopie;
  String id;
  BattingTeam battingTeam;
  TOver currentOver;
  TOver lastOver;
  LastBatsmanOut lastBatsmanOut;
  String? remainingBalls;
  Bowler bowler;
  String? text;
  String? matchId;

  factory Inning.fromJson(Map<String, dynamic> json) => Inning(
        bowlers:
            List<Bowler>.from(json["bowlers"].map((x) => Bowler.fromJson(x))),
        wickets: List<LastBatsmanOut>.from(
            json["wickets"].map((x) => LastBatsmanOut.fromJson(x))),
        extras: Extras.fromJson(json["extras"]),
        wicketsInCount: json["wicketsInCount"],
        batsmen: List<LastBatsmanOut>.from(
            json["batsmen"].map((x) => LastBatsmanOut.fromJson(x))),
        retired: List<dynamic>.from(json["retired"].map((x) => x)),
        wicketfall: List<dynamic>.from(json["wicketfall"].map((x) => x)),
        finished: json["finished"],
        oldCopie: List<dynamic>.from(json["oldCopie"].map((x) => x)),
        id: json["_id"],
        battingTeam: BattingTeam.fromJson(json["battingTeam"]),
        currentOver: TOver.fromJson(json["currentOver"]),
        lastOver: TOver.fromJson(json["lastOver"]),
        lastBatsmanOut: LastBatsmanOut.fromJson(json["lastBatsmanOut"]),
        remainingBalls: json["remainingBalls"],
        bowler: Bowler.fromJson(json["bowler"]),
        text: json["text"],
        matchId: json["matchId"],
      );
}

class LastBatsmanOut {
  LastBatsmanOut({
    required this.name,
    required this.isOnStrike,
    required this.balls,
    required this.batsmanRuns,
    required this.fours,
    required this.sixes,
    required this.strikeRate,
    required this.outBy,
  });

  String? name;
  bool isOnStrike;
  int balls;
  int batsmanRuns;
  int fours;
  int sixes;
  double strikeRate;
  String outBy;

  factory LastBatsmanOut.fromJson(Map<String, dynamic> json) => LastBatsmanOut(
        name: json["name"],
        isOnStrike: json["isOnStrike"] ?? false,
        balls: json["balls"] ?? 0,
        batsmanRuns: json["batsmanRuns"] ?? 0,
        fours: json["fours"] ?? 0,
        sixes: json["sixes"] ?? 0,
        strikeRate: (json["strikeRate"] ?? 0).toDouble(),
        outBy: json["outBy"] == null ? '' : json["outBy"],
      );
}

class BattingTeam {
  BattingTeam({
    required this.name,
    required this.partnerShipBalls,
    required this.partnerShipScore,
    required this.runRate,
    required this.score,
    required this.wickets,
    required this.overs,
    required this.balls,
    required this.requiredRunRate,
    required this.requiredRuns,
    required this.projScr,
    required this.target,
  });

  String? name;
  int partnerShipBalls;
  int partnerShipScore;
  double runRate;
  int score;
  int wickets;
  String overs;
  int balls;
  double requiredRunRate;
  int requiredRuns;
  int projScr;
  int target;

  factory BattingTeam.fromJson(Map<String, dynamic> json) => BattingTeam(
        name: json["name"],
        partnerShipBalls: json["partnerShipBalls"] ?? 0,
        partnerShipScore: json["partnerShipScore"] ?? 0,
        runRate: json["runRate"].toDouble() ,
        score: json["score"] ?? 0,
        wickets: json["wickets"] ?? 0,
        overs: ((json["overs"] ?? 0) is int) ? (json["overs"] ?? 0).toString() : json["overs"],
        balls: json["balls"] ?? 0,
        requiredRunRate: (json["requiredRunRate"] ?? 0).toDouble(),
        requiredRuns:
            json["requiredRuns"] == null ? 0 : json["requiredRuns"],
        projScr: json["projScr"] == null ? 0 : json["projScr"],
        target: json["target"] == null ? 0 : json["target"],
      );
}

class Bowler {
  Bowler({
    required this.name,
    required this.overs,
    required this.maidens,
    required this.wickets,
    required this.bowlerRuns,
    required this.economy,
  });

  String? name;
  double overs;
  int maidens;
  int wickets;
  int bowlerRuns;
  double economy;

  factory Bowler.fromJson(Map<String, dynamic> json) => Bowler(
        name: json["name"],
        overs: json["overs"].toDouble(),
        maidens: json["maidens"] ?? 0,
        wickets: json["wickets"] ?? 0,
        bowlerRuns: json["bowlerRuns"] ?? 0,
        economy: json["economy"].toDouble(),
      );
}

class TOver {
  TOver({
    required this.bowlerName,
    required this.batsNames,
    required this.overNumber,
    required this.runs,
    required this.score,
    required this.wickets,
    required this.balls,
  });

  String bowlerName;
  List<String> batsNames;
  int overNumber;
  int runs;
  int score;
  int wickets;
  List<Ball> balls;

  factory TOver.fromJson(Map<String, dynamic> json) => TOver(
        bowlerName: json["bowlerName"],
        batsNames: List<String>.from(json["batsNames"].map((x) => x)),
        overNumber: json["overNumber"] ?? 0,
        runs: json["runs"] ?? 0,
        score: json["score"] ?? 0,
        wickets: json["wickets"] ?? 0,
        balls: List<Ball>.from(json["balls"].map((x) => Ball.fromJson(x))),
      );
}

class Ball {
  Ball({
    required this.number,
    required this.value,
    required this.type,
  });

  int number;
  String? value;
  String? type;

  factory Ball.fromJson(Map<String, dynamic> json) => Ball(
        number: json["number"] ?? 0,
        value: json["value"],
        type: json["type"],
      );
}
class Extras {
  Extras({
    required this.nb,
    required this.wide,
    required this.lb,
    required this.bye,
  });

  int nb;
  int wide;
  int lb;
  int bye;

  factory Extras.fromJson(Map<String, dynamic> json) => Extras(
        nb: json["nb"] ?? 0,
        wide: json["wide"] ?? 0,
        lb: json["lb"] ?? 0,
        bye: json["bye"] ?? 0,
      );
}

class Session {
  Session({
    required this.mtype,
    required this.mname,
    required this.name,
    required this.back,
    required this.lay,
    required this.status,
    required this.statusLabel,
  });

  String? mtype;
  String? mname;
  String? name;
  dynamic back;
  dynamic lay;
  String? status;
  String? statusLabel;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        mtype: json["mtype"],
        mname: json["mname"],
        name: json["name"],
        back: json["back"],
        lay: json["lay"],
        status: json["status"],
        statusLabel: json["statusLabel"],
      );
}
