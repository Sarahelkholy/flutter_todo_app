// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todolist/data/model/task.dart';
import 'package:todolist/provider/task/task_provider.dart';
import 'package:todolist/utils/appAlert.dart';
import 'package:todolist/widgets/common_container.dart';
import 'package:todolist/utils/extentions.dart';
import 'package:todolist/widgets/task_tile.dart';
import 'package:todolist/widgets/task_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisplayTasks extends ConsumerWidget {
  DisplayTasks({super.key, this.isCompleteTasks = false, required this.tasks});
  List<Task> tasks;
  final bool isCompleteTasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompleteTasks ? deviceSize.height * .25 : deviceSize.height * 0.3;
    final emptyTaskMessage = isCompleteTasks
        ? 'There is no completed tasks yet'
        : 'There is no tasks todo';
    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTaskMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return InkWell(
                    onLongPress: () {
                      AppAlert.showDeletedAlertDialog(context, ref, task);
                    },
                    onTap: () async {
                      await showModalBottomSheet(
                          context: context,
                          builder: (ctx) {
                            return TaskDetails(task: task);
                          });
                    },
                    child: TaskTile(
                      task: task,
                      onCompleted: (value) async {
                        await ref
                            .read(TaskProvider.notifier)
                            .UpdateTask(task)
                            .then((value) {
                          AppAlert.displaySnackBar(
                              context,
                              task.isCompleted
                                  ? 'Task incomplete'
                                  : 'Task completed');
                        });
                      },
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}
