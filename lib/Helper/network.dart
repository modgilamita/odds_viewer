import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:odds_viewer/Helper/icc_ranking_model.dart';
import 'package:odds_viewer/Helper/live_match.dart';
import 'package:odds_viewer/Helper/models.dart';
import 'package:odds_viewer/Helper/pointTable.dart';

class Network {

  Network._privateConstructor();
  static final Network shared = Network._privateConstructor();

  final baseUrl = "https://oddsviewer.com/";
  final contactUsEndPoint = "contact";
  final liveMatches = "liveMatches?matchType=1&page=";
  final pointTable = "point-tables";
  final iccRanking = "admin/ranking-icc";

  // Submit contact request
  Future<Result> submitContact(Map<String, dynamic> params) async {
    final response = await http.post(Uri.parse(baseUrl+contactUsEndPoint),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        },
      body: jsonEncode(params),
    );
    return Result.fromJson(jsonDecode(response.body));
  }

  // List Live matches
  Future<List<LiveMatch>> liveMatchesData(String page) async {
    final response = await http.get(Uri.parse(baseUrl+liveMatches+page));
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return List<LiveMatch>.from(parsed.map((i) => LiveMatch.fromJson(i)));
  }

  // Point table
  Future<List<Points>> pointTableData() async {
    final response = await http.get(Uri.parse(baseUrl+pointTable));
    return parsePoints(response.body).where((element) => element.championship != null).toList();
  }

  List<Points> parsePoints(String response) {
    final  parsed = jsonDecode(response).cast<Map<String, dynamic>>();
    return List<Points>.from(parsed.map((i) => Points.fromJson(i)));
  }

  // ICC Ranking
  Future<Ranking> iccRankingData() async {
    final response = await http.get(Uri.parse(baseUrl+iccRanking));
    return Ranking.fromJson(jsonDecode(response.body));
  }
}
