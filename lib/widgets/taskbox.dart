import 'package:flutter/material.dart';
import 'package:to_do_list/Model/todo.dart';

class Taskbox extends StatelessWidget {
  final Todo task;
  final bool completed;
  final Function(bool?)? onChanged;
  final VoidCallback? delete;
  final VoidCallback? info;
  const Taskbox({
    super.key,
    required this.task,
    required this.completed,
    required this.onChanged,
    required this.delete,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: delete,
      onTap: info,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF7E64FF),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              value: completed,
              onChanged: onChanged,
            ),
            Column(
              children: [
                Text(
                  task.taskName ?? "",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  task.taskDue ?? "",
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
