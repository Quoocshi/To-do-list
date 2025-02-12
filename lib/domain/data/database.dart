import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_list/domain/Model/todo.dart';

class Database {
  final CollectionReference tasks =
      FirebaseFirestore.instance.collection('todo');

  // Thêm task vào Firestore
  Future<void> addTask(Todo task) async {
    try {
      await tasks.doc(task.id).set(task.toMap());
    } catch (e) {
      print('Lỗi khi thêm task: $e');
    }
  }

  // Xóa task từ Firestore
  Future<void> deleteTask(String id) async {
    try {
      await tasks.doc(id).delete();
    } catch (e) {
      print('Lỗi khi xóa task: $e');
    }
  }

  Future<void> change(bool? completeCheck, String id) async {
    try {
      await tasks.doc(id).update({'completeCheck': completeCheck});
    } catch (e) {
      print('Lỗi khi cập nhật trạng thái: $e');
    }
  }

  // Lấy danh sách tasks từ Firestore
  Stream<List<Todo>> getTasks() {
    return tasks.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Todo.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }
}
