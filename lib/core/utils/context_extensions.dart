import 'package:flutter/cupertino.dart';

extension ContextExtensions on num {
  SizedBox get allHeight => SizedBox(height: toDouble());
  SizedBox get allWidth => SizedBox(width: toDouble());
}