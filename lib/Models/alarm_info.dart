import 'package:flutter/material.dart';

class AlarmInfo {
  DateTime alarmDateTime;
  String? description;
  bool? isActive;
  List<Color>? gradientColors;

  AlarmInfo({
    required this.alarmDateTime,
    this.description,
    this.gradientColors,
  });
}
