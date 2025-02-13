import 'package:get/get.dart';
import 'package:to_do_list/presentation/Screens/mainscreen.dart';
import 'package:to_do_list/presentation/Screens/taskscreen.dart';

class AppRoutes {
  static String mainscreen = '/';
  static String taskscreen = '/task';
  static List<GetPage> routes = [
    GetPage(name: mainscreen, page: () => MainScreen()),
    GetPage(name: taskscreen, page: () => NewTask()),
  ];
}
