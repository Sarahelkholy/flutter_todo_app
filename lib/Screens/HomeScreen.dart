// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:todolist/config/routes/route_location.dart';
import 'package:todolist/data/model/task.dart';
import 'package:todolist/provider/dateProvider.dart';
import 'package:todolist/provider/task/task_provider.dart';
import 'package:todolist/utils/extentions.dart';
import 'package:todolist/utils/helpers.dart';
import 'package:todolist/widgets/display_white_text.dart';
import 'package:gap/gap.dart';
import 'package:todolist/widgets/display_tasks_list.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(TaskProvider);
    final completedtask = _completedTask(taskState.tasks, ref);
    final incompletedTask = _incompletedTask(taskState.tasks, ref);
    final selectedDate = ref.watch(dateProvider);
    return Scaffold(
        body: Stack(
      children: [
        Column(children: [
          Container(
            height: deviceSize.height * 0.3,
            width: deviceSize.width,
            color: colors.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () => Helpers.selectDate(context, ref),
                    child: DisplayWhite(
                      text: DateFormat.yMMMd().format(selectedDate),
                      fontsize: 20,
                      fontWeight: FontWeight.normal,
                    )),
                DisplayWhite(
                  text: 'My ToDo List',
                  fontsize: 40,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
          )
        ]),
        Positioned(
            top: 120,
            right: 0,
            left: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayTasks(tasks: incompletedTask),
                    const Gap(20),
                    Text(
                      'Complete',
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    DisplayTasks(
                      tasks: completedtask,
                      isCompleteTasks: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                        onPressed: () => context.push(RouteLocation.creatTask),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: DisplayWhite(
                            text: 'Add New Task',
                          ),
                        )),
                  ],
                ),
              ),
            ))
      ],
    ));
  }

  List<Task> _completedTask(List<Task> tasks, WidgetRef ref) {
    final List<Task> filterdTasks = [];
    final selectedDate = ref.watch(dateProvider);
    for (var task in tasks) {
      final isTaskDay = Helpers.isTaskFromSelectedDate(task, selectedDate);
      if (task.isCompleted && isTaskDay) {
        filterdTasks.add(task);
      }
    }
    return filterdTasks;
  }

  List<Task> _incompletedTask(List<Task> tasks, WidgetRef ref) {
    final List<Task> filterdTasks = [];
    final selectedDate = ref.watch(dateProvider);
    for (var task in tasks) {
      final isTaskDay = Helpers.isTaskFromSelectedDate(task, selectedDate);
      if (!task.isCompleted && isTaskDay) {
        filterdTasks.add(task);
      }
    }
    return filterdTasks;
  }
}
