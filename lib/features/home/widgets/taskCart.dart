import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class TaskListBuilder extends StatelessWidget {
  const TaskListBuilder({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.secondaryColor,
              offset: Offset(0, 4),
              blurRadius: 15,
            ),
          ],
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.caption1.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              subTitle,
              style: TextStyles.caption1.copyWith(color: AppColors.greyColor),
            ),
            Row(
              children: [
                SvgPicture.asset(AppImages.timeCircleSvg),
                Gap(5),
                Text(
                  "10:00 AM - 12:00 AM",
                  style: TextStyles.caption2.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Done",
                    style: TextStyles.caption2.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      separatorBuilder: (context, index) => Gap(10),
      itemCount: 3,
    );
  }
}
