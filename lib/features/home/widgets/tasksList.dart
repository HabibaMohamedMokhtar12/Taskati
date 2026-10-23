import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/features/home/widgets/customTab.dart';
import 'package:taskati/features/home/widgets/taskCart.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/text_styles.dart';

class Taskslist extends StatefulWidget {
  const Taskslist({super.key});

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
                  title: "Market Research",
                  subTitle:
                      "Grocery shopping app design Grocery shopping app design",
                ),
                TaskListBuilder(
                  title: "Market Research",
                  subTitle:
                      "Grocery shopping app design Grocery shopping app design",
                ),
                TaskListBuilder(
                  title: "Market Research",
                  subTitle:
                      "Grocery shopping app design Grocery shopping app design",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
