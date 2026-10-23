import 'dart:io';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/features/home/widgets/homeHeader.dart';
import 'package:taskati/features/home/widgets/tasksList.dart';

import '../../../core/constants/app_images.dart';
import '../widgets/stateContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.background, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 60,
              right: 20,
              left: 20,
              bottom: 20,
            ),
            child: Column(
              spacing: 20,
              children: [
                Homeheader(),
                Statecontainer(progress: 0.8),
                DatePicker(
                  height: 90,
                  width: 70,
                  DateTime.now().subtract(Duration(days: 3)),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: AppColors.primaryColor,
                  selectedTextColor: AppColors.whiteColor,
                  onDateChange: (date) {},
                ),
                Taskslist(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
