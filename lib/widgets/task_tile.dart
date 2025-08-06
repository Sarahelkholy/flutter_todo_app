import 'package:flutter/material.dart';
import 'package:todolist/data/model/task.dart';
import 'package:todolist/widgets/circle_container.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function(bool?)? onCompleted;

  const TaskTile({super.key, required this.task, this.onCompleted});
  @override
  Widget build(BuildContext context) {
    final double iconOpacacity = task.isCompleted ? 0.3 : 0.5;
    final double backgroundOpacity = task.isCompleted ? 0.1 : 0.3;
    final textdecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontweight = task.isCompleted ? FontWeight.normal : FontWeight.bold;

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(backgroundOpacity),
            child: Center(
                child: Icon(task.category.icon,
                    color: task.category.color.withOpacity(iconOpacacity))),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title,
                    style: TextStyle(
                        decoration: textdecoration,
                        fontSize: 20,
                        fontWeight: fontweight)),
                Text(task.time, style: TextStyle(decoration: textdecoration)),
              ],
            ),
          ),
          Checkbox(value: task.isCompleted, onChanged: onCompleted)
        ],
      ),
    );
  }
}
