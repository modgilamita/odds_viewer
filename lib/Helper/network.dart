import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:odds_viewer/Helper/models.dart';

class Network {

  Network._privateConstructor();
  static final Network shared = Network._privateConstructor();

  final baseUrl = "https://oddsviewer.com/";
  final contactUsEndPoint = "contact";
  final liveMatches = "";

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

}