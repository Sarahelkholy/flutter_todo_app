import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/repositories/task_repository_provider.dart';
import 'package:todolist/provider/task/task_notifier.dart';
import 'package:todolist/provider/task/task_state.dart';

final TaskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(TaskRepositoryProvider);
  return TaskNotifier(repository);
});
