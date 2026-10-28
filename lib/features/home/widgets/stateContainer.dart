import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskati/core/services/local/hive_helper.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class Statecontainer extends StatelessWidget {
  const Statecontainer({super.key, required this.selectedDate});

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveHelper.taskBox.listenable(),
      builder: (context, box, child) {
        var allTasks = box.values.toList();

        String formattedSelectedDate = DateFormat('dd MMM, yyyy')
            .format(selectedDate);

        var dayTasks = allTasks
            .where((task) => task.date == formattedSelectedDate)
            .toList();

        int totalTasks = dayTasks.length;

        int completedTasks = dayTasks
            .where((task) => task.isCompleted == true)
            .length;

        double progress = totalTasks == 0 ? 0.0 : completedTasks / totalTasks;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).primaryColor,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('EE, dd MMM').format(selectedDate),
                      style: TextStyles.body.copyWith(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(12),
                    Text(
                      totalTasks == 0
                          ? "No tasks for this day"
                          : "$completedTasks of $totalTasks tasks completed",
                      style: TextStyles.body.copyWith(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(15),
              CircularPercentIndicator(
                radius: 40.0,
                lineWidth: 8.0,
                percent: progress,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  "${(progress * 100).toInt()}%",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                progressColor: Theme.of(context).colorScheme.inversePrimary,
                backgroundColor: const Color(0xFF8764FF),
              ),
            ],
          ),
        );
      },
    );
  }
}
