import 'package:get/get.dart';
import 'package:to_do_list/Model/Todo.dart';

class TaskController extends GetxController {
  // final _tasklist = Hive.box('LocalDatabase');
  // TaskDatabase db = TaskDatabase();

  var tasks = <Todo>[].obs;
  void addTask(Todo task) {
    if (task.taskName != '') {
      tasks.add(task);
      //db.updateDatabase();
    }
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    //db.updateDatabase();
  }

  void change(bool? p0, int index) {
    tasks[index].completeCheck = !tasks[index].completeCheck;
    tasks.refresh();
    //db.updateDatabase();
  }

  //void saveTask(Todo task, int index) {}
}
