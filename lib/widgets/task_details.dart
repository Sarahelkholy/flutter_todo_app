import 'package:flutter/material.dart';
import 'package:todolist/data/model/task.dart';
import 'package:todolist/utils/extentions.dart';
import 'package:todolist/widgets/circle_container.dart';

class TaskDetails extends StatelessWidget {
  final Task task;
  const TaskDetails({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(0.3),
            child: Icon(
              task.category.icon,
              color: task.category.color,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            task.title,
            style: style.labelMedium
                ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(task.time, style: style.labelMedium),
          const SizedBox(
            height: 16,
          ),
          Visibility(
              visible: !task.isCompleted,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('task to be completed on ${task.date}'),
                  Icon(
                    Icons.check_box,
                    color: task.category.color,
                  )
                ],
              )),
          const SizedBox(
            height: 16,
          ),
          Divider(
            thickness: 1.5,
            color: task.category.color,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(task.note.isEmpty ? 'there is no aditional notes' : task.note),
          const SizedBox(
            height: 16,
          ),
          Visibility(
              visible: task.isCompleted,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('task is completed'),
                  Icon(
                    Icons.check_box,
                    color: Colors.green,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
