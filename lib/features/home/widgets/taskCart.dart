import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/functions/naviagtions.dart';
import 'package:taskati/core/models/taskModel.dart';
import 'package:taskati/core/models/task_status_enum.dart';
import 'package:taskati/core/services/local/hive_helper.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/features/taskDetailes/pages/task_screen.dart';

import '../../../core/functions/extentions.dart';

class TaskListBuilder extends StatelessWidget {
  const TaskListBuilder({
    super.key,
    required this.selectedDate,
    required this.taskStatus,
    this.taskModel,
  });

  final DateTime selectedDate;
  final TaskStatusEnum taskStatus;
  final TaskModel? taskModel;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveHelper.taskBox.listenable(),
      builder: (context, box, child) {
        var allTasks = box.values.toList();
        String formattedSelectedDate = DateFormat('dd MMM, yyyy')
            .format(selectedDate);

        List selectedTasks = [];

        for (var task in allTasks) {
          if (task.date == formattedSelectedDate) {
            if (taskStatus == TaskStatusEnum.all) {
              selectedTasks.add(task);
            } else if (taskStatus == TaskStatusEnum.inProgress &&
                task.isCompleted == false) {
              selectedTasks.add(task);
            } else if (taskStatus == TaskStatusEnum.completed &&
                task.isCompleted == true) {
              selectedTasks.add(task);
            }
          }
        }

        if (selectedTasks.isEmpty) {
          return Center(
            child: Column(
              children: [
                Lottie.asset(AppImages.emptyLogoLottie),
                Gap(10),
                Text(
                  "No Tasks Found for today",
                  style: TextStyles.caption1.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemCount: selectedTasks.length,
          itemBuilder: (context, index) {
            var task = selectedTasks[index];

            return Slidable(
              key: UniqueKey(),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),

                dismissible: DismissiblePane(
                  onDismissed: () {
                    HiveHelper.taskBox.delete(task.id);
                  },
                ),

                children: [
                  SlidableAction(
                    onPressed: (context) {
                      HiveHelper.taskBox.delete(task.id);
                    },
                    backgroundColor: Theme.of(context).colorScheme.error,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              endActionPane: ActionPane(
                dismissible: DismissiblePane(
                  onDismissed: () async {
                    task.isCompleted = true;
                    await task.save();
                  },
                ),
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    flex: 2,
                    onPressed: (context) {
                      pushTo(context, TaskScreen(taskModel: task));
                    },
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                  SlidableAction(
                    flex: 2,
                    onPressed: (context) async {
                      task.isCompleted = true;
                      await task.save();
                    },
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    foregroundColor: Colors.white,
                    icon: Icons.check,
                    label: 'Complete',
                  ),
                ],
              ),

              child: GestureDetector(
                onTap: () {
                  pushTo(context, TaskScreen(taskModel: task));
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    boxShadow: context.isDark
                        ? []
                        : [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.tertiary
                                  .withOpacity(0.3),
                              offset: const Offset(0, 4),
                              blurRadius: 15,
                            ),
                          ],
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title ?? '',
                        style: TextStyles.caption1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(8),
                      Text(
                        task.description ?? '',
                        style: TextStyles.caption1.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      const Gap(8),
                      Row(
                        children: [
                          SvgPicture.asset(AppImages.timeCircleSvg),
                          const Gap(5),
                          Text(
                            "${task.startTime ?? ''} - ${task.endTime ?? ''}",
                            style: TextStyles.caption2.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              task.isCompleted = !(task.isCompleted ?? false);
                              task.save();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: task.isCompleted == true
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).colorScheme.tertiary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                task.isCompleted == true
                                    ? "Done"
                                    : "In Progress",
                                style: TextStyles.caption2.copyWith(
                                  color: task.isCompleted == true
                                      ? Theme.of(context)
                                            .colorScheme
                                            .inversePrimary
                                      : Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Gap(10),
        );
      },
    );
  }
}
