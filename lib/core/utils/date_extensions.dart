import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  String get formattedDate => DateFormat('yyyy-MM-dd').format(this);
}