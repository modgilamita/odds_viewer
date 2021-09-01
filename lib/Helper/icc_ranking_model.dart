import 'dart:ffi';

import 'package:flutter/material.dart';

class Ranking {
  final String id;
  final dynamic data;
  final String type;

  const Ranking({
    required this.id,
    required this.data,
    required this.type,
  });
  factory Ranking.fromJson(Map<String, dynamic > json) {
    return Ranking(id: json['_id'],
                 data: json['data'],
                 type: json['type'],
    );
  }
}
