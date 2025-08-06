import 'package:flutter/material.dart';
import 'package:todolist/data/model/task.dart';
import 'package:todolist/provider/task/task_provider.dart';
import 'package:todolist/utils/extentions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppAlert {
  AppAlert._();
  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: context.textTheme.bodyLarge
            ?.copyWith(color: context.colorScheme.surface),
      ),
      backgroundColor: context.colorScheme.primary,
    ));
  }

  static Future<void> showDeletedAlertDialog(
      BuildContext context, WidgetRef ref, Task task) async {
    Widget cancelButton =
        TextButton(onPressed: () => context.pop(), child: const Text('No'));
    Widget deletButton = TextButton(
        onPressed: () async {
          await ref.read(TaskProvider.notifier).deleteTask(task).then((value) {
            displaySnackBar(context, 'task deleted successfully');
            context.pop();
          });
        },
        child: const Text('Yes'));
    AlertDialog alertDialog = AlertDialog(
      title: const Text('Are you sure yo want to delete this task '),
      actions: [cancelButton, deletButton],
    );
    await showDialog(
        context: context,
        builder: (ctx) {
          return alertDialog;
        });
  }
}
