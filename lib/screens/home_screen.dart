import 'package:flutter/material.dart';
import 'package:todoapp2/screens/add_task_screen.dart';
import 'package:todoapp2/screens/all_tasks.dart';
import 'package:todoapp2/screens/complete_screen.dart';
import 'package:todoapp2/shared/app_color.dart';
import 'package:todoapp2/shared/app_string.dart';
import 'package:todoapp2/shared/app_style.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> screens = [
    {'title': "All Tasks", 'screen': AllTasksScreen()},
    {'title': "Complete Tasks", 'screen': CompleteScreen()}
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        title: Text(
          screens[currentIndex]['title'],
          style: AppStyle.largeStyle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: AppColor.appBarColor,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddTaskScreen(),
          ));
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: screens[currentIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "All",
            icon: Icon(
              Icons.list,
            ),
          ),
          BottomNavigationBarItem(
            label: "Complete",
            icon: Icon(
              Icons.check,
            ),
          ),
        ],
        elevation: 50,
      ),
    );
  }
}
