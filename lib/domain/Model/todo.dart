class Todo {
  final String id;
  final String? taskName;
  final String? taskDescription;
  final String? taskDue;
  bool completeCheck;

  Todo({
    required this.id,
    required this.taskName,
    required this.taskDescription,
    required this.taskDue,
    required this.completeCheck,
  });

  // Chuyển đổi từ object sang map để lưu lên Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskName': taskName,
      'taskDescription': taskDescription,
      'taskDue': taskDue,
      'completeCheck': completeCheck,
    };
  }

  // Chuyển đổi từ Firestore map sang object
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      taskName: map['taskName'],
      taskDescription: map['taskDescription'],
      taskDue: map['taskDue'],
      completeCheck: map['completeCheck'] ?? false,
    );
  }
}
