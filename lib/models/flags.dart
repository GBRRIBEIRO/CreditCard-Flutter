import 'package:flutter/material.dart';

class Flag {
  Flag(
      {required this.flagName,
      required this.initials,
      required this.logoImage});

  final String flagName;
  final List<String> initials;
  final Image logoImage;
}
