import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class Statecontainer extends StatelessWidget {
  const Statecontainer({super.key, required this.progress});
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('EE, dd MMM').format(DateTime.now()),
                  style: TextStyles.body.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(12),
                Text(
                  "Your today’s task almost  almost ",
                  style: TextStyles.body.copyWith(color: AppColors.whiteColor),
                ),
              ],
            ),
          ),
          Gap(15),

          CircularPercentIndicator(
            radius: 40.0,
            lineWidth: 8.0,
            percent: progress,
            circularStrokeCap: CircularStrokeCap.round,
            center: Text(
              "${(progress * 100).toInt()}%",
              style: TextStyle(color: AppColors.whiteColor),
            ),
            progressColor: AppColors.whiteColor,
            backgroundColor: Color(0xFF8764FF),
          ),
        ],
      ),
    );
  }
}
