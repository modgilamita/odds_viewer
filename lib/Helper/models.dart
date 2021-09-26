
import 'package:flutter/material.dart';

class Result {
  final bool success;
  final String message;

  Result({
    required this.success,
    required this.message,
});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      success: json['success'],
      message: json['message'],
    );
  }
}

class PlayerModel {
  final String column1;
  final String column2;
  final String column3;
  final String column4;
  final String column5;
  final String column6;
  final String? outBy;
  final Color color;

  PlayerModel({
    required this.column1,
    required this.column2,
    required this.column3,
    required this.column4,
    required this.column5,
    required this.column6,
    required this.outBy,
    required this.color,
});
}

