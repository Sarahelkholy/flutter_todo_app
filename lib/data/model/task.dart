import 'package:todolist/utils/taskKeys.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist/utils/Task_category.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final String date;
  final String time;
  final TaskCategories category;
  final bool isCompleted;

  const Task(
      {this.id,
      required this.date,
      required this.isCompleted,
      required this.note,
      required this.time,
      required this.title,
      required this.category});

  @override
  List<Object?> get props {
    return [id, date, isCompleted, note, time, title, category];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      TaskKeys.id: id,
      TaskKeys.title: title,
      TaskKeys.note: note,
      TaskKeys.time: time,
      TaskKeys.date: date,
      TaskKeys.category: category.name,
      TaskKeys.isCompleted: isCompleted ? 1 : 0,
    };
  }

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      id: map[TaskKeys.id],
      title: map[TaskKeys.title],
      note: map[TaskKeys.note],
      time: map[TaskKeys.time],
      date: map[TaskKeys.date],
      category: TaskCategories.stringToCategory(map[TaskKeys.category]),
      isCompleted: map[TaskKeys.isCompleted] == 1 ? true : false,
    );
  }

  Task copyWith({
    int? id,
    String? title,
    String? note,
    String? date,
    String? time,
    TaskCategories? category,
    bool? isCompleted,
  }) {
    return Task(
        id: id ?? this.id,
        date: date ?? this.date,
        isCompleted: isCompleted ?? this.isCompleted,
        note: note ?? this.note,
        time: time ?? this.time,
        title: title ?? this.title,
        category: category ?? this.category);
  }
}
