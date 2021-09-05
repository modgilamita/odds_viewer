import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/network.dart';
import 'package:odds_viewer/Helper/pointTable.dart';


class PointTable extends StatefulWidget {
  const PointTable({Key? key}) : super(key: key);

  @override
  _PointTableState createState() => _PointTableState();
}

class _PointTableState extends State<PointTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Point Table",
          style: TextStyle(
            color: OVColor.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        iconTheme: IconThemeData(color: OVColor.textColor),
        backgroundColor: OVColor.themeColor,
      ),
      body: Center(
        child: PointTableUI(),
      ),
    );
  }
}

class PointTableUI extends StatelessWidget {
  const PointTableUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Points>>(
        future: Network.shared.pointTableData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(snapshot.error.toString())));
            print(snapshot.error);
            return Text("Please try again in some time");
          } else if (snapshot.hasData) {
            return Padding(padding: EdgeInsets.all(16),
            child: PointsListUI(points: snapshot.data!),);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class PointsListUI extends StatelessWidget {
  const PointsListUI({Key? key, required this.points}) : super(key: key);

  final List<Points> points;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: points.length,
        itemBuilder: (context, index) {
          final championship = points[index].championship!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    child: Image.network(Network.shared.baseUrl + "images/" + championship.image!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  Padding(padding: EdgeInsets.all(4),),
                  Text(championship.name!,
                    style: OVTextStyle.boldTitle(),)
                ],
              ),
              ),
            ],
          );
      },
      )
    );
  }
}

