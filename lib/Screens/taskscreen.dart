import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/Model/Todo.dart';
import 'package:to_do_list/controller/controller.dart';
import 'package:to_do_list/widgets/textField.dart';

class NewTask extends StatelessWidget {
  NewTask({super.key});
  //normal controller
  final dynamic tasknameController = TextEditingController();

  final dynamic taskdescriptionController = TextEditingController();

  final dynamic taskdueController = TextEditingController();
  //getx controller
  final TaskController taskController = Get.find<TaskController>();
  @override
  Widget build(BuildContext context) {
    Todo temp;
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Task'),
          leading: IconButton(
              //go back to mainscreen on tap
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back)),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 40),
            TheTextField(
              controller: tasknameController,
              hintext: 'Enter task name...',
            ),
            const SizedBox(height: 20),
            TheTextField(
              controller: taskdescriptionController,
              hintext: 'Enter task description...',
            ),
            const SizedBox(height: 20),
            TheTextField(
              controller: taskdueController,
              hintext: 'Enter task due...',
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => {
                //temp variable
                temp = Todo(
                  taskName: tasknameController.text,
                  taskDescription: taskdescriptionController.text,
                  taskDue: taskdueController.text,
                  completeCheck: false,
                ),
                //call function
                taskController.addTask(temp),

                //go back to mainscreen on tap
                Navigator.pop(context),
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70),
                ),
                minimumSize: const Size(20, 50),
              ),
              child: const Text('Add'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              //go back to mainscreen on tap
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70),
                ),
                fixedSize: const Size(20, 50),
              ),
              child: const Text('Cancel'),
            ),
          ],
        ));
  }
}
