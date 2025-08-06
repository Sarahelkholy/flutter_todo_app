import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/utils/Task_category.dart';

final categoryProvider = StateProvider.autoDispose<TaskCategories>((ref) {
  return TaskCategories.education;
});
