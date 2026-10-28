import 'package:flutter/material.dart';
import 'package:taskati/core/models/task_status_enum.dart';
import 'package:taskati/features/home/widgets/customTab.dart';
import 'package:taskati/features/home/widgets/taskCart.dart';

class Taskslist extends StatefulWidget {
  const Taskslist({super.key, required this.selectedDate});

  final DateTime selectedDate;

  @override
  State<Taskslist> createState() => _TaskslistState();
}

class _TaskslistState extends State<Taskslist> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            dividerHeight: 0,
            indicator: const BoxDecoration(color: Colors.transparent),
            indicatorPadding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: const EdgeInsets.symmetric(horizontal: 4),
            tabs: [
              Tab(
                child: Customtab(
                  label: "All",
                  isSelected: _tabController.index == 0,
                ),
              ),
              Tab(
                child: Customtab(
                  label: "In progress",
                  isSelected: _tabController.index == 1,
                ),
              ),
              Tab(
                child: Customtab(
                  label: "Completed",
                  isSelected: _tabController.index == 2,
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                TaskListBuilder(
                  selectedDate: widget.selectedDate,
                  taskStatus: TaskStatusEnum.all,
                ),
                TaskListBuilder(
                  selectedDate: widget.selectedDate,
                  taskStatus: TaskStatusEnum.inProgress,
                ),
                TaskListBuilder(
                  selectedDate: widget.selectedDate,
                  taskStatus: TaskStatusEnum.completed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
