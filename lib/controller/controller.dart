import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/Model/todo.dart';

class TaskController extends GetxController {
  var tasklist = <Todo>[].obs;
  late Box<Todo> box;
  @override
  void onInit() {
    super.onInit();
    box = Hive.box<Todo>('LocalDatabase');
    loadTasks();
  }

// Load dữ liệu từ box vào tasklist
  void loadTasks() {
    tasklist.value = box.values.toList().cast<Todo>();
  }

// Khi thực hiện phương thức nào đó, phải thức hiện cho cả tasklist và box
// vì tasklist giúp hiển thị ngay lập tức khi thực hiện thao tác
// còn box giúp lưu trữ dữ liệu sau khi tắt app
  void addTask(Todo task) {
    if (task.taskName!.isNotEmpty) {
      box.put(task.id, task);
      tasklist.add(task);
    }
  }

  void removeTask(int index) {
    var task = tasklist[index];
    box.delete(task.id);
    tasklist.removeAt(index);
  }

  //lỗi khi thay đổi trạng thái
  //task sẽ tạo thêm task mới với trạng thái mới
  //đồng thời không thể xóa task đó(đã fix)
  void change(bool? p0, int index) {
    var task = tasklist[index];
    task.completeCheck = p0 ?? false;
    box.put(task.id, task);
    tasklist[index] = task;
    tasklist.refresh();
  }
}
