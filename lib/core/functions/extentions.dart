import 'package:flutter/material.dart';
import 'package:taskati/core/services/local/hive_helper.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  bool get isDark => HiveHelper.getData(HiveHelper.kIsDark) ?? false;
}
