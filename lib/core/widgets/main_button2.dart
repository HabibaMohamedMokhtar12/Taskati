import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/text_styles.dart';

class MainButton2 extends StatelessWidget {
  const MainButton2({super.key, required this.text, required this.onPressed});
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.secondaryColor, width: 1.5),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),

        backgroundColor: AppColors.secondaryColor,
      ),
      child: Text(
        text,
        style: TextStyles.body.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
