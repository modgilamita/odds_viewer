import 'package:intl/intl.dart';
import 'package:odds_viewer/Helper/live_match.dart';

class Docs {
  final List<OVMatch> docs;
  const Docs({
    required this.docs,
  });

  factory Docs.fromJson(Map<String, dynamic> json) {
    return Docs(
        docs: List<OVMatch>.from(json["docs"].map((x) => OVMatch.fromJson(x)))
    );
  }
}

class OVMatch {
  final String status;
  final dynamic innings;
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
      innings: json['innings'],
      marketRate: json['marketRate'],
      session: json['session'],
      lambi: json['lambi'],
      bookmarker: json['bookmarker'],
      scores: json['scores'],
      id: json['_id'],
      championShip: (json['championShip'] is String) ? json['championShip'] : ChampionShip.fromJson(json['championShip']),
      teamA: Team.fromJson(json['teamA']),
      teamB: Team.fromJson(json['teamB']),
      startDate: json['startDate'],
      utcStartDate: DateFormat('yyyy-MM-dd hh:mm:ss').parse(json['startDateUtc'], true),
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