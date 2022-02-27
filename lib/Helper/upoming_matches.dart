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
  var marketRate;
  var session;
  final dynamic lambi;
  var bookmarker;
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
      innings:
          List<Inning>.from(json["innings"].map((x) => Inning.fromJson(x))),
      marketRate: List<MarketRate>.from(
          json["marketRate"].map((x) => MarketRate.fromJson(x))),
      session:
          List<Session>.from(json["session"].map((x) => Session.fromJson(x))),
      lambi: json['lambi'],
      bookmarker: List<MarketRate>.from(
          json["bookmarker"].map((x) => MarketRate.fromJson(x))),
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

class Session {
  final String mtype;
  final String mname;
  final String name;
  final MarketObject back;
  final MarketObject lay;
  final String status;
  final String statusLabel;
  Session({
    required this.mtype,
    required this.mname,
    required this.name,
    required this.back,
    required this.lay,
    required this.status,
    required this.statusLabel,
  });
  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      mtype: json['mtype'] != null ? json["mtype"] : "",
      mname: json['mname'] != null ? json["mname"] : "",
      name: json['name'] != null ? json["name"] : "",
      back: json['back'] != null
          ? MarketObject.fromJson(json['back'])
          : MarketObject.empty(),
      lay: json['lay'] != null
          ? MarketObject.fromJson(json['lay'])
          : MarketObject.empty(),
      status: json['status'] != null ? json["status"] : "",
      statusLabel: json['statusLabel'] != null ? json["statusLabel"] : "",
    );
  }
}

class MarketRate {
  final String name;
  final MarketObject back;
  final MarketObject lay;
  MarketRate({
    required this.name,
    required this.back,
    required this.lay,
  });
  factory MarketRate.fromJson(Map<String, dynamic> json) {
    return MarketRate(
      name: json['name'] != null ? json['name'] : "",
      back: json['back'] != null
          ? MarketObject.fromJson(json['back'])
          : MarketObject.empty(),
      lay: json['lay'] != null
          ? MarketObject.fromJson(json['lay'])
          : MarketObject.empty(),
    );
  }
}

class MarketObject {
  final String price;
  final String size;
  final String line;
  MarketObject({
    required this.price,
    required this.size,
    required this.line,
  });
  factory MarketObject.fromJson(Map<String, dynamic> json) {
    return MarketObject(
      price: json['price'] != null ? json['price'].toString() : '',
      size: json['size'] != null ? json['size'].toString() : '',
      line: json['line'] != null ? json['line'].toString() : '',
    );
  }
  static MarketObject empty() {
    return MarketObject(price: "", size: "", line: "");
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
      finished: (json['finished'] is bool) ? json['finished'] : false,
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
  TOver? currentOver;
  TOver? lastOver;
  LastBatsmanOut? lastBatsmanOut;
  String? remainingBalls;
  Bowler? bowler;
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
        finished: (json["finished"] is bool) ? json["finished"] : false,
        oldCopie: List<dynamic>.from(json["oldCopie"].map((x) => x)),
        id: json["_id"],
        battingTeam: BattingTeam.fromJson(json["battingTeam"]),
        currentOver: json["currentOver"] == null
            ? null
            : TOver.fromJson(json["currentOver"]),
        lastOver:
            json["lastOver"] == null ? null : TOver.fromJson(json["lastOver"]),
        lastBatsmanOut: json["lastBatsmanOut"] == null
            ? null
            : LastBatsmanOut.fromJson(json["lastBatsmanOut"]),
        remainingBalls: json["remainingBalls"],
        bowler: json["bowler"] is List ? null : Bowler.fromJson(json["bowler"]),
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
        isOnStrike: json["isOnStrike"] == null ? false : json["isOnStrike"],
        balls: json["balls"] == null ? 0 : json["balls"],
        batsmanRuns: json["batsmanRuns"] == null ? 0 : json["batsmanRuns"],
        fours: json["fours"] == null ? 0 : json["fours"],
        sixes: json["sixes"] == null ? 0 : json["sixes"],
        strikeRate:
            json["strikeRate"] == null ? 0.0 : json["strikeRate"].toDouble(),
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
        partnerShipBalls:
            json["partnerShipBalls"] == null ? 0 : json["partnerShipBalls"],
        partnerShipScore:
            json["partnerShipScore"] == null ? 0 : json["partnerShipScore"],
        runRate: json["runRate"].toDouble(),
        score: json["score"] == null ? 0 : json["score"],
        wickets: json["wickets"] == null ? 0 : json["wickets"],
        overs: (json["overs"] is int)
            ? json["overs"].toString()
            : (json["overs"] ?? '0'),
        balls: json["balls"] == null ? 0 : json["balls"],
        requiredRunRate:
            (json["requiredRunRate"] == null ? 0.0 : json["requiredRunRate"])
                .toDouble(),
        requiredRuns: json["requiredRuns"] == null ? 0 : json["requiredRuns"],
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
        maidens: json["maidens"] == null ? 0 : json["maidens"],
        wickets: json["wickets"] == null ? 0 : json["wickets"],
        bowlerRuns: json["bowlerRuns"] == null ? 0 : json["bowlerRuns"],
        economy: json["economy"] == null ? 0 : json["economy"].toDouble(),
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
        overNumber: json["overNumber"] == null ? 0 : json["overNumber"],
        runs: json["runs"] == null ? 0 : json["runs"],
        score: json["score"] == null ? 0 : json["score"],
        wickets: json["wickets"] == null ? 0 : json["wickets"],
        balls: List<Ball>.from(json["balls"].map((x) => Ball.fromJson(x))),
      );

  static emptyOver() {
    return TOver(
        bowlerName: "-",
        batsNames: [],
        overNumber: 0,
        runs: 0,
        score: 0,
        wickets: 0,
        balls: []);
  }
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
        number: json["number"] == null ? 0 : json["number"],
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
        nb: json["nb"] == null ? 0 : json["nb"],
        wide: json["wide"] == null ? 0 : json["wide"],
        lb: json["lb"] == null ? 0 : json["lb"],
        bye: json["bye"] == null ? 0 : json["bye"],
      );
}
