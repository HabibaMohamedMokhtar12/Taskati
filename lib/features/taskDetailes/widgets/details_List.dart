import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/text_styles.dart';

class DetailsList extends StatelessWidget {
  const DetailsList({
    super.key,
    required this.leading,
    required this.title,
    required this.subTitle,
    required this.onTap,
    this.error,
  });

  final String leading;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 15,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          leading: SvgPicture.asset(leading),
          title: Text(
            title,
            style: TextStyles.caption3.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          subtitle: Text(
            error ?? subTitle,
            style: TextStyles.caption1.copyWith(
              fontWeight: error != null ? FontWeight.normal : FontWeight.w500,
              color: error != null
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
          trailing: SvgPicture.asset(
            AppImages.arrowDownSVG,
            width: 20,
            height: 20,
          ),

          onTap: onTap,
        ),
      ),
    );
  }
}
