import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/Screens/info.dart';
import 'package:to_do_list/Screens/taskscreen.dart';
import 'package:to_do_list/controller/controller.dart';
import 'package:to_do_list/widgets/taskbox.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final TaskController taskcontroller = Get.put(TaskController());

  //final TaskController taskController1 = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'To Do',
          style: TextStyle(
            color: Color(0xFFE5E5E7),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2A2A2E),
              Color(0xFF1F1338),
              Color(0xFF000000),
            ],
            stops: [0.18, 0.45, 0.85],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Obx(
          () => ListView.builder(
            itemCount: taskcontroller.tasklist.length,
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
        backgroundColor: const Color(0xFF7E64FF),
        foregroundColor: const Color(0xFFFFFFFF),
        child: const Icon(Icons.add),
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
