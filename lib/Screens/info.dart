import 'package:flutter/material.dart';
import 'package:to_do_list/Model/todo.dart';

class InfoScreen extends StatelessWidget {
  final Todo task;
  const InfoScreen({super.key, required this.task});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7E64FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7E64FF),
        title: const Text(
          'Task Info',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Title:',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Text(
            '${task.taskName}',
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Task description:',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            // task.taskDescription?.isEmpty: return true if task description is empty but not null, return null if its null
            // ?? true: if left is null (task.taskDescription?.isEmpty) pick right
            '${task.taskDescription?.isEmpty ?? true ? 'No task description' : task.taskDescription}',
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
          // const SizedBox(height: 20),
          // const Text(
          //   'Due date:',
          //   style: TextStyle(
          //     fontSize: 18,
          //     color: Colors.white,
          //   ),
          // ),
          // Text(
          //   '${task.taskDue?.isEmpty ?? true ? 'No task due' : task.taskDue}',
          //   style: const TextStyle(
          //     fontSize: 25,
          //     color: Colors.white,
          //   ),
          // ),
        ],
      ),
    );
  }
}
