import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String? taskName;
  @HiveField(2)
  final String? taskDescription;
  @HiveField(3)
  final String? taskDue;
  @HiveField(4)
  bool completeCheck;
  Todo({
    required this.taskName,
    required this.taskDescription,
    required this.taskDue,
    required this.completeCheck,
  }) : id = DateTime.now().microsecondsSinceEpoch.toString();
}
