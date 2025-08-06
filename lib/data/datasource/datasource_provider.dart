// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/datasource/task_datasource.dart';

final DataSourceProvider = Provider<TaskDatasource>((ref) {
  return TaskDatasource();
});
