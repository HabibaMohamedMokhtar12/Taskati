import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/text_styles.dart';

class Customtab extends StatelessWidget {
  const Customtab({super.key, required this.label, required this.isSelected});
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyles.body.copyWith(
            color: isSelected ? AppColors.whiteColor : AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}
