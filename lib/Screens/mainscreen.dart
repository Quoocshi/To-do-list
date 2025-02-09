import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/Screens/info.dart';
import 'package:to_do_list/Screens/taskscreen.dart';
import 'package:to_do_list/controller/controller.dart';
import 'package:to_do_list/widgets/taskbox.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final TaskController taskcontroller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'To-Do List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 5,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Obx(
          () => ListView.separated(
            itemCount: taskcontroller.tasklist.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              var task = taskcontroller.tasklist[index];
              return Taskbox(
                task: task,
                completed: task.completeCheck,
                onChanged: (p0) => taskcontroller.change(p0, index),
                delete: () => taskcontroller.removeTask(index),
                info: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoScreen(
                      task: task,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add, size: 30),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewTask(),
          ),
        ),
      ),
    );
  }
}
