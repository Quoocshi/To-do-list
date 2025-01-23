import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/Model/todo.dart';

class TaskController extends GetxController {
  final tasklist = Hive.box<Todo>('LocalDatabase').obs;
  //var tasks = <Todo>[].obs;
  void addTask(Todo task) {
    if (tasklist.value.get(task.id)?.taskName != '') {
      //tasks.add(task);
      tasklist.value.put(task.id, task);
    }
    tasklist.refresh();
  }

  void removeTask(int index) {
    //tasks.removeAt(index);
    var task = tasklist.value.getAt(index);
    if (task != null) {
      tasklist.value.delete(task.id);
    }
    tasklist.refresh();
  }

  void change(bool? p0, int index) {
    //tasks[index].completeCheck = !tasks[index].completeCheck;
    var task = tasklist.value.getAt(index);
    task!.completeCheck = !task.completeCheck;
    tasklist.value.putAt(index, task);
    //tasks.refresh();
    tasklist.refresh();
  }
}
