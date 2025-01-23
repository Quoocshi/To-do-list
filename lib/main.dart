import 'package:flutter/material.dart';
import 'package:to_do_list/Model/todo.dart';
import 'package:to_do_list/Screens/mainscreen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialze hive
  await Hive.initFlutter();
  //Register Adapter
  Hive.registerAdapter(TodoAdapter());
  //open a box
  await Hive.openBox<Todo>('LocalDatabase');
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
