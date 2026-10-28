import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/models/taskModel.dart';
import 'package:taskati/core/services/local/hive_helper.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/features/taskDetailes/widgets/details_List.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/functions/extentions.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key, this.taskModel});

  final TaskModel? taskModel;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController descriptionController;

  String? selectedDate;
  String? selectedStartTime;
  String? selectedEndTime;
  bool isClicked = false;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(
      text: widget.taskModel?.title ?? '',
    );
    descriptionController = TextEditingController(
      text: widget.taskModel?.description ?? '',
    );

    selectedDate = widget.taskModel?.date;
    selectedStartTime = widget.taskModel?.startTime;
    selectedEndTime = widget.taskModel?.endTime;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isEdit = widget.taskModel != null;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              context.isDark ? AppImages.darkbackground : AppImages.background,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(
                            AppImages.arrowBackSVG,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          isEdit ? "Edit Task" : "Add Task",
                          style: TextStyles.title2,
                        ),
                        const Spacer(),
                        const Gap(48),
                      ],
                    ),
                    const Gap(30),
                    CustomTextField(
                      title: "Title",
                      controller: titleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Task Title';
                        }
                        return null;
                      },
                    ),
                    const Gap(20),
                    CustomTextField(
                      title: "Description",
                      controller: descriptionController,
                      maxLines: 4,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Task Description';
                        }
                        return null;
                      },
                    ),
                    const Gap(40),
                    DetailsList(
                      error: isClicked && selectedDate == null
                          ? 'Please select date'
                          : null,
                      leading: AppImages.calendarSvg,
                      title: 'Date',
                      subTitle: selectedDate ?? 'Select Date',
                      onTap: () async {
                        var date = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 60),
                          ),
                        );
                        if (date != null) {
                          setState(() {
                            selectedDate = DateFormat('dd MMM, yyyy')
                                .format(date);
                          });
                        }
                      },
                    ),
                    const Gap(20),
                    DetailsList(
                      error: isClicked && selectedStartTime == null
                          ? 'Please select start time'
                          : null,
                      leading: AppImages.timeCircleSvg,
                      title: 'Start Time',
                      subTitle: selectedStartTime ?? 'Select Time',
                      onTap: () async {
                        var time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (time != null) {
                          setState(() {
                            selectedStartTime = time.format(context);
                          });
                        }
                      },
                    ),
                    const Gap(20),
                    DetailsList(
                      error: isClicked && selectedEndTime == null
                          ? 'Please select end time'
                          : null,
                      leading: AppImages.timeCircleSvg,
                      title: 'End Time',
                      subTitle: selectedEndTime ?? 'Select Time',
                      onTap: () async {
                        var time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (time != null) {
                          setState(() {
                            selectedEndTime = time.format(context);
                          });
                        }
                      },
                    ),
                    const Gap(30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: MainButton(
            text: isEdit ? 'Edit Task' : 'Add Task',
            onPressed: () {
              setState(() {
                isClicked = true;
              });

              if (formKey.currentState!.validate()) {
                if (selectedDate == null ||
                    selectedStartTime == null ||
                    selectedEndTime == null) {
                  return;
                }

                if (isEdit) {
                  widget.taskModel!.title = titleController.text;
                  widget.taskModel!.description = descriptionController.text;
                  widget.taskModel!.date = selectedDate;
                  widget.taskModel!.startTime = selectedStartTime;
                  widget.taskModel!.endTime = selectedEndTime;
                  widget.taskModel!.save();
                } else {
                  TaskModel newTask = TaskModel(
                    title: titleController.text,
                    description: descriptionController.text,
                    date: selectedDate,
                    startTime: selectedStartTime,
                    endTime: selectedEndTime,
                    isCompleted: false,
                  );
                  HiveHelper.taskBox.add(newTask);
                }

                Navigator.pop(context);
              }
            },
          ),
        ),
      ),
    );
  }
}
