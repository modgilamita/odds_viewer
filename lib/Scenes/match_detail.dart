import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/network.dart';
import 'package:odds_viewer/Helper/upoming_matches.dart';
import 'package:odds_viewer/Scenes/InningRecords.dart';
import 'package:odds_viewer/Scenes/LiveLine.dart';
import 'package:odds_viewer/Scenes/MatchInfo.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MatchDetailScene extends StatefulWidget {
  const MatchDetailScene({Key? key, required this.match}) : super(key: key);

  final OVMatch match;

  @override
  _MatchDetailSceneState createState() => _MatchDetailSceneState();
}

class _MatchDetailSceneState extends State<MatchDetailScene> {
  int _selectedSegmentedIndex = 1;
  late OVMatch matchDetails;
  late TOver currentOver;
  late String ballInfo;
  late List<MarketRate> marketRateData;
  late List<MarketRate> bookmarkerData;
  late List<Session> sessionData;

  Map<int, Widget> _children = {
    0: Text(
      'MATCH INFO',
    ),
    1: Text('LIVE LINE'),
    2: Text('SCOREBOARD'),
  };

  @override
  Widget build(BuildContext context) {
    if (widget.match.status.toLowerCase() == "upcoming") {
      print("Connect to Socket");
      _connectSocket();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Match Live Line",
          style: TextStyle(
            color: OVColor.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        iconTheme: IconThemeData(color: OVColor.textColor),
        backgroundColor: OVColor.themeColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(padding: EdgeInsets.all(8)),
          MaterialSegmentedControl(
            children: _children,
            selectionIndex: _selectedSegmentedIndex,
            borderColor: Colors.grey,
            selectedColor: OVColor.textColor,
            unselectedColor: OVColor.themeColor,
            borderRadius: 8.0,
            onSegmentChosen: (int index) {
              setState(() {
                _selectedSegmentedIndex = index;
              });
            },
          ),
          _loadData(),
        ],
      ),
    );
  }

  _connectSocket() {
    // var logger = Logger();

    IO.Socket socket = IO.io(Network.shared.baseUrl,
        IO.OptionBuilder().setTransports(['websocket']).build());
    socket.onConnect((_) {
      print("Connected");
    });
    socket.emit("join-room", widget.match.id);
    socket.on("socket-server", (data) {
      _parseSocketData(data);
      // logger.log(Level.verbose, data);
    });
    socket.onDisconnect((_) {
      print("Disconnected");
    });
    socket.connect();
  }

  _loadData() {
    return FutureBuilder<OVMatch>(
        future: Network.shared.matchDetails(widget.match.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            matchDetails = widget.match;
            return _buildUI();
          } else if (snapshot.hasData) {
            matchDetails = snapshot.data as OVMatch;
            if (matchDetails.innings.isNotEmpty) {
              final _inning = matchDetails.innings.last;
              ballInfo = _inning.currentOver != null
                  ? _inning.currentOver!.balls.last.value == 'W'
                      ? _inning.currentOver!.balls.last.type!
                      : _inning.currentOver!.balls.last.value!
                  : "";
              currentOver = _inning.currentOver ?? TOver.emptyOver();
              marketRateData = matchDetails.marketRate;
              bookmarkerData = matchDetails.bookmarker;
            }
            return _buildUI();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  _buildUI() {
    switch (_selectedSegmentedIndex) {
      case 0:
        return MatchInfo(match: matchDetails);
      case 1:
        return MatchLiveLine(
          ballInfo: ballInfo,
          currentOver: currentOver,
          match: matchDetails,
          marketRates: marketRateData,
          bookmarkers: bookmarkerData,
        );
      case 2:
        return InningRecords(match: matchDetails);
      default:
        return Text('No record found');
    }
  }

  _parseSocketData(Map<String, dynamic> json) {
    String key = json["method"];
    print(key);
    switch (key) {
      case "fast-text":
        setState(() {
          ballInfo = json["data"];
        });
        print(json);
        break;
      case "new-ball":
        final data = json["data"];
        final over = TOver.fromJson(data["currentOver"]);
        setState(() {
          currentOver = over;
        });
        break;
      case "match-rates":
        final data = json["data"];
        final bookmarker = List<MarketRate>.from(
            data["bookmarker"].map((x) => MarketRate.fromJson(x)));
        final market = List<MarketRate>.from(
            data["marketRate"].map((x) => MarketRate.fromJson(x)));
        final session =
            List<Session>.from(data["session"].map((x) => Session.fromJson(x)));
        setState(() {
          matchDetails.bookmarker = bookmarker;
          matchDetails.marketRate = market;
          matchDetails.session = session;
        });
        break;
      default:
        break;
    }
  }
}
