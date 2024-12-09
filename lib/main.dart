import 'package:flutter/material.dart';
import 'package:to_do_list/Screens/mainscreen.dart';

void main() async {
  // await Hive.initFlutter();
  // var box = await Hive.openBox('LocalDatabase');
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
