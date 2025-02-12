import 'package:get/get.dart';
import 'package:to_do_list/domain/Model/todo.dart';
import 'package:to_do_list/domain/data/database.dart';

class TaskController extends GetxController {
  var tasklist = <Todo>[].obs;
  final Database database = Database();

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  //load task
  void fetchTasks() {
    database.getTasks().listen((tasks) {
      tasklist.assignAll(tasks);
    });
  }

  Future<void> addTask(Todo task) async {
    await database.addTask(task);
  }

  Future<void> change(bool? value, int index) async {
    if (value != null) {
      tasklist[index].completeCheck = value;
      await database.change(value, tasklist[index].id);
      tasklist.refresh();
    }
  }

  Future<void> removeTask(int index) async {
    await database.deleteTask(tasklist[index].id);
  }
}
