import 'package:flutter/material.dart';
import 'package:todoapp2/screens/add_task_screen.dart';
import 'package:todoapp2/screens/edit_screen.dart';
import 'package:todoapp2/screens/home_screen.dart';
import 'package:todoapp2/shared/cash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  runApp(const Todo());
}

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
