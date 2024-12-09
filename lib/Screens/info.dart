import 'package:flutter/material.dart';
import 'package:to_do_list/Model/Todo.dart';

class InfoScreen extends StatelessWidget {
  final Todo task;
  const InfoScreen({super.key, required this.task});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task name: ${task.taskName}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            Text(
              // task.taskDescription?.isEmpty: return true if task description is empty but not null, return null if its null
              // ?? true: if left is null (task.taskDescription?.isEmpty) pick right
              'Task descroption: ${task.taskDescription?.isEmpty ?? true ? 'No task description' : task.taskDescription}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            Text(
              'Task due: ${task.taskDue?.isEmpty ?? true ? 'No task due' : task.taskDue}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
