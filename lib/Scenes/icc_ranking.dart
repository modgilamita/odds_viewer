import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/icc_ranking_model.dart';
import 'package:odds_viewer/Helper/network.dart';

class IccRanking extends StatefulWidget {
  const IccRanking({Key? key}) : super(key: key);
  @override
  _IccRankingState createState() => _IccRankingState();
}

class _IccRankingState extends State<IccRanking> with TickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    new Tab(text: "Teams"),
    new Tab(text: "Batsman"),
    new Tab(text: "Bowler"),
    new Tab(text: "All Rounder"),
  ];

  late TabController _tabController;
  late Ranking _ranking;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
        print("Change index to " + _tabController.index.toString());
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ICC Ranking",
          style: TextStyle(
            color: OVColor.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        iconTheme: IconThemeData(color: OVColor.textColor),
        backgroundColor: OVColor.themeColor,
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs,
          isScrollable: true,
          indicatorColor: OVColor.textColor,
          labelColor: OVColor.textColor,
        ),
      ),
      body: FutureBuilder<Ranking>(
          future: Network.shared.iccRankingData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _ranking = snapshot.data!;
              return buildUI(_selectedIndex);
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  buildUI(int index) {
    switch (index) {
      case 0:
        return ICCRankingListUI(
          platform: _ranking.data.team,
          tabIndex: 0,
        );
      case 1:
        return ICCRankingListUI(
          platform: _ranking.data.batting,
          tabIndex: 1,
        );
      case 2:
        return ICCRankingListUI(
          platform: _ranking.data.bowling,
          tabIndex: 2,
        );
      case 3:
        return ICCRankingListUI(
          platform: _ranking.data.all,
          tabIndex: 3,
        );
    }
  }
}

class ICCRankingListUI extends StatefulWidget {
  const ICCRankingListUI({Key? key, required this.platform, required this.tabIndex}) : super(key: key);

  final Platform platform;
  final int tabIndex;
  @override
  _ICCRankingListUIState createState() => _ICCRankingListUIState();
}

enum PlatformEnum { odi, test, t20 }

class _ICCRankingListUIState extends State<ICCRankingListUI> {
  PlatformEnum _selectedPlatform = PlatformEnum.odi;

  @override
  Widget build(BuildContext context) {
    final _selectedStyle = ButtonStyle(
        backgroundColor: MaterialStateProperty.all(OVColor.textColor),
        foregroundColor: MaterialStateProperty.all(OVColor.themeColor));
    final _normalStyle = ButtonStyle(
        backgroundColor: MaterialStateProperty.all(OVColor.textColor.withAlpha(175)),
        foregroundColor: MaterialStateProperty.all(OVColor.themeColor));
    final _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedPlatform = PlatformEnum.odi;
                    });
                  },
                  child: Text("ODI"),
                  style: _selectedPlatform == PlatformEnum.odi ? _selectedStyle : _normalStyle),
              Spacer(),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedPlatform = PlatformEnum.t20;
                    });
                  },
                  child: Text("T20"),
                  style:  _selectedPlatform == PlatformEnum.t20 ? _selectedStyle : _normalStyle),
              Spacer(),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedPlatform = PlatformEnum.test;
                    });
                  },
                  child: Text("Test"),
                  style:  _selectedPlatform == PlatformEnum.test ? _selectedStyle : _normalStyle),
            ],
          ),
          Padding(padding: EdgeInsets.all(8)),
          headerView(_width),
          Padding(padding: EdgeInsets.all(8)),
          ListView.builder(
              itemCount: data().length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          data()[index].name,
                          textAlign: TextAlign.start,
                        ),
                        width: _width / 3,
                      ),
                      Container(
                        child: Text(
                          data()[index].country,
                          textAlign: TextAlign.center,
                        ),
                        width: _width / 6,
                      ),
                      Container(
                        child: Text(
                          data()[index].points,
                          textAlign: TextAlign.center,
                        ),
                        width: _width / 6,
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }

  Row headerView(double _width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(
            widget.tabIndex == 0 ? "Country" : "Name",
            textAlign: TextAlign.start,
            style: OVTextStyle.boldTitle(),
          ),
          width: _width / 3,
        ),
        Container(
          child: Text(
            widget.tabIndex == 0 ? "" : "Country",
            textAlign: TextAlign.center,
            style: OVTextStyle.boldTitle(),
          ),
          width: _width / 6,
        ),
        Container(
          child: Text(
            "Points",
            textAlign: TextAlign.center,
            style: OVTextStyle.boldTitle(),
          ),
          width: _width / 6,
        ),
      ],
    );
  }

  List<Player> data() {
    switch (_selectedPlatform) {
      case PlatformEnum.odi:
        return widget.platform.odi;
      case PlatformEnum.t20:
        return widget.platform.t20;
      case PlatformEnum.test:
        return widget.platform.test;
    }
  }
}
