import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/domain/Model/todo.dart';
import 'package:to_do_list/domain/repository/task_repository.dart';
import 'package:to_do_list/widgets/textfield.dart';

class NewTask extends StatefulWidget {
  NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  //normal controller
  final TextEditingController tasknameController = TextEditingController();
  final TextEditingController taskdescriptionController =
      TextEditingController();
  final TextEditingController taskdueController = TextEditingController();

  //getx controller
  final TaskController taskController = Get.find<TaskController>();

  //Datetime
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Todo temp;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'New Task',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            //go back to mainscreen on tap
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TheTextField(
                controller: tasknameController,
                labelText: 'Title:',
                size: 5,
                maxline: 1,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TheTextField(
                      controller: taskdueController,
                      labelText: 'Due date:',
                      size: 5,
                      maxline: 1,
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        final DateTime? dateTime = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(3000),
                        );
                        if (dateTime != null) {
                          setState(() {
                            taskdueController.text =
                                '${dateTime.day}/${dateTime.month}/${dateTime.year}';
                          });
                        }
                      },
                      icon: const Icon(Icons.date_range_rounded,
                          color: Colors.green))
                ],
              ),
              const SizedBox(height: 20),
              TheTextField(
                controller: taskdescriptionController,
                labelText: 'Description:',
                size: 5,
                maxline: 5,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => {
                      //temp variable
                      temp = Todo(
                        id: DateTime.now().microsecondsSinceEpoch.toString(),
                        taskName: tasknameController.text,
                        taskDescription: taskdescriptionController.text,
                        taskDue: taskdueController.text,
                        completeCheck: false,
                      ),
                      //call function
                      taskController.addTask(temp),

                      //go back to mainscreen on tap
                      Get.back(),
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70),
                      ),
                      minimumSize: const Size(150, 50),
                    ),
                    child: const Text('Add', style: TextStyle(fontSize: 16)),
                  ),
                  ElevatedButton(
                    //go back to mainscreen on tap
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70),
                      ),
                      minimumSize: const Size(150, 50),
                    ),
                    child: const Text('Cancel', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
