import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/datasource/datasource_provider.dart';
import 'package:todolist/data/repositories/task_repositories.dart';
import 'package:todolist/data/repositories/task_repoistories_impl.dart';

final TaskRepositoryProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.watch(DataSourceProvider);
  return TaskRepoistoriesImpl(datasource);
});
