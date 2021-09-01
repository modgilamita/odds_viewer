import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:odds_viewer/Helper/models.dart';
import 'package:odds_viewer/Helper/pointTable.dart';

class Network {

  Network._privateConstructor();
  static final Network shared = Network._privateConstructor();

  final baseUrl = "https://oddsviewer.com/";
  final contactUsEndPoint = "contact";
  final liveMatches = "";
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


  // Point table
  Future<List<Points>> pointTableData() async {
  //   Future pointTableData() async {
    final response = await http.get(Uri.parse(baseUrl+pointTable));
    return parsePoints(response.body);
  }

  List<Points> parsePoints(String response) {
    final  parsed = jsonDecode(response).cast<Map<String, dynamic>>();
    return List<Points>.from(parsed.map((i) => Points.fromJson(i)));
  }

  // ICC Ranking
  Future<String> iccRankingData() async {
    final response = await http.get(Uri.parse(baseUrl+iccRanking));
    return jsonDecode(response.body);
  }
}