import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/Screens/info.dart';
import 'package:to_do_list/Screens/taskscreen.dart';
import 'package:to_do_list/controller/controller.dart';
import 'package:to_do_list/widgets/taskbox.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  // TextEditingController _name = TextEditingController(text: name);
  final TaskController taskcontroller = Get.put(TaskController());

  //final TaskController taskController1 = Get.find<TaskController>();

  // void change(bool? p0, int index) {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('To Do'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: taskcontroller.tasks.length,
          itemBuilder: (context, index) {
            return Taskbox(
              task: taskcontroller.tasks[index],
              completed: taskcontroller.tasks[index].completeCheck,
              onChanged: (p0) => taskcontroller.change(p0, index),
              delete: () => taskcontroller.removeTask(index),
              info: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoScreen(
                    task: taskcontroller.tasks[index],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
