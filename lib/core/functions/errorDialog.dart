import 'package:flutter/material.dart';
import 'package:taskati/core/styles/app_colors.dart';

void showErrorDialog(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.redColor,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Text(message),
    ),
  );
}
