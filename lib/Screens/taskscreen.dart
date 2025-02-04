import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/Model/todo.dart';
import 'package:to_do_list/controller/controller.dart';
import 'package:to_do_list/widgets/textfield.dart';

class NewTask extends StatefulWidget {
  NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  //normal controller
  final dynamic tasknameController = TextEditingController();

  final dynamic taskdescriptionController = TextEditingController();

  final dynamic taskdueController = TextEditingController();

  //getx controller
  final TaskController taskController = Get.find<TaskController>();

  //Datetime
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Todo temp;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'New Task',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            //go back to mainscreen on tap
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          color: const Color(0xFF7E64FF),
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [
          //       Color(0xFF2A2A2E),
          //       Color(0xFF1F1338),
          //       Color(0xFF000000),
          //     ],
          //     stops: [0.18, 0.45, 0.85],
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //   ),
          // ),
          child: ListView(
            children: [
              //const SizedBox(height: 5),
              TheTextField(
                controller: tasknameController,
                labelText: 'Title: ',
                size: 5,
                maxline: 1,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: TheTextField(
                      controller: taskdueController,
                      labelText: 'Due date: ',
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
                            lastDate: DateTime(3000));
                        if (dateTime != null) {
                          setState(() {
                            taskdueController.text =
                                '${dateTime.day}/${dateTime.month}/${dateTime.year}';
                          });
                        }
                      },
                      icon: const Icon(Icons.date_range_rounded))
                ],
              ),
              const SizedBox(height: 20),
              TheTextField(
                controller: taskdescriptionController,
                labelText: 'Description: ',
                size: 5,
                maxline: 5,
              ),
              const SizedBox(height: 40),
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
                  Navigator.pop(context),
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3A3372),
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
                  foregroundColor: const Color(0xFFFF636C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70),
                  ),
                  fixedSize: const Size(20, 50),
                ),
                child: const Text('Cancel'),
              ),
            ],
          ),
        ));
  }
}
