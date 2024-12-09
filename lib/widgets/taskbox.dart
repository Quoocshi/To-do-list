import 'package:flutter/material.dart';
import 'package:to_do_list/Model/Todo.dart';

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
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: 25.0),
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
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  task.taskDue ?? "",
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
