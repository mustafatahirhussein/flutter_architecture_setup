import 'package:flutter/material.dart';

extension MediaQueryExtensions on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}