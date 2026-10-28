import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskati/core/services/local/hive_helper.dart';
import 'package:taskati/core/styles/app_colors.dart';

import '../../../core/styles/text_styles.dart';

class Homeheader extends StatefulWidget {
  const Homeheader({super.key});

  @override
  State<Homeheader> createState() => _HomeheaderState();
}

class _HomeheaderState extends State<Homeheader> {
  String name = '';
  String image = '';

  @override
  void initState() {
    // TODO: implement initState
    name = HiveHelper.getData(HiveHelper.kName);
    image = HiveHelper.getData(HiveHelper.kImage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (image.isNotEmpty)
          ClipOval(
            child: Image.file(
              File(image),
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello!", style: TextStyles.caption1),
              Gap(4),
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.subtitle.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
        Gap(10),
        IconButton(
          onPressed: () {
            bool isDark = HiveHelper.getData(HiveHelper.kIsDark) ?? false;
            HiveHelper.cacheData(HiveHelper.kIsDark, !isDark);
          },
          icon: Icon(Icons.dark_mode),
        ),
      ],
    );
  }
}
