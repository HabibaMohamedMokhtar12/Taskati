import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../styles/app_colors.dart';
import '../styles/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.title,
    this.validator,
    this.color,
    this.controller,
    this.maxLines = 1,
  });

  final String? title;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Color? color;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        if (title != null) ...[
          Text(
            title ?? '',
            style: TextStyles.caption2.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const Gap(8),
        ],
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 4),
                blurRadius: 15,
              ),
            ],
          ),
          child: TextFormField(
            validator: validator,
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              filled: true,
              fillColor: color ?? Theme.of(context).colorScheme.inversePrimary,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
