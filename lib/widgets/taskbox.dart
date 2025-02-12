import 'package:flutter/material.dart';
import 'package:to_do_list/domain/Model/todo.dart';

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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        title: Text(
          task.taskName ?? 'Untitled Task',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: task.completeCheck ? Colors.grey : Colors.black87,
            decoration: task.completeCheck
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        leading: Checkbox(
          activeColor: Colors.green,
          value: task.completeCheck,
          onChanged: onChanged,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: delete,
        ),
        onTap: info,
      ),
    );
  }
}
