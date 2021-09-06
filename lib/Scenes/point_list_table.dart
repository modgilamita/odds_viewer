
import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/pointTable.dart';

class PointListTable extends StatefulWidget {
  const PointListTable({Key? key, required this.pointTable}) : super(key: key);
  final Points pointTable;

  @override
  _PointListTableState createState() => _PointListTableState();
}

class _PointListTableState extends State<PointListTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.pointTable.championship!.name!,
        style: TextStyle(
          color: OVColor.textColor,
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
      iconTheme: IconThemeData(color: OVColor.textColor),
      backgroundColor: OVColor.themeColor,
      ),
      body: Text(widget.pointTable.data.toString()),
    );
  }
}
