import 'dart:io';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:taskati/core/functions/naviagtions.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/features/home/widgets/homeHeader.dart';
import 'package:taskati/features/home/widgets/tasksList.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/functions/extentions.dart';
import '../../taskDetailes/pages/task_screen.dart';
import '../widgets/stateContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              context.isDark ? AppImages.darkbackground : AppImages.background,
              fit: BoxFit.cover,
            ),
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
                Statecontainer(selectedDate: selectedDate),
                DatePicker(
                  height: 90,
                  width: 70,
                  DateTime.now().subtract(Duration(days: 3)),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Theme.of(context).primaryColor,
                  selectedTextColor: Theme.of(context)
                      .colorScheme
                      .inversePrimary,
                  onDateChange: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
                Taskslist(selectedDate: selectedDate),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,

        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        onPressed: () {
          pushTo(context, TaskScreen());
        },
      ),
    );
  }
}
