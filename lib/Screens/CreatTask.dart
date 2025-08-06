// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:todolist/config/routes/route_location.dart';
import 'package:todolist/data/model/task.dart';
import 'package:todolist/provider/categoryProvider.dart';
import 'package:todolist/provider/dateProvider.dart';
import 'package:todolist/provider/task/task_provider.dart';
import 'package:todolist/provider/timeProvider.dart';
import 'package:todolist/utils/appAlert.dart';
import 'package:todolist/utils/helpers.dart';
import 'package:todolist/widgets/select_category.dart';
import 'package:todolist/widgets/display_white_text.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/widgets/common_text_container.dart';
import 'package:gap/gap.dart';
import 'package:todolist/widgets/select_date.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CreatTaskScreen extends ConsumerStatefulWidget {
  static CreatTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreatTaskScreen();
  const CreatTaskScreen({super.key});

  @override
  ConsumerState<CreatTaskScreen> createState() => _CreatTaskScreenState();
}

class _CreatTaskScreenState extends ConsumerState<CreatTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DisplayWhite(
          text: 'Add new task',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextContainer(
                title: 'Task Title',
                hint: 'Task Title',
                controller: _titleController,
              ),
              SelectCategory(),
              const Gap(16),
              const SelectDate(),
              const Gap(16),
              CommonTextContainer(
                title: 'note',
                hint: 'Task notes',
                maxline: 6,
                controller: _noteController,
              ),
              const Gap(50),
              ElevatedButton(
                  onPressed: _creatTask, child: DisplayWhite(text: 'Save'))
            ],
          ),
        ),
      ),
    );
  }

  void _creatTask() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final time = ref.watch(timeProvider);
    final date = ref.watch(dateProvider);
    final category = ref.watch(categoryProvider);
    if (title.isNotEmpty) {
      final task = Task(
          date: DateFormat.yMMMd().format(date),
          isCompleted: false,
          note: note,
          time: Helpers.timeToString(time),
          title: title,
          category: category);

      await ref.read(TaskProvider.notifier).createTask(task).then((value) {
        AppAlert.displaySnackBar(context, 'Task created successfully');
        context.go(RouteLocation.home);
      });
    } else {
      AppAlert.displaySnackBar(context, 'Task title cannot be empty');
    }
  }
}
