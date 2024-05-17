import 'package:flutter/material.dart';
import 'package:todoapp2/networking/DB.dart';
import 'package:todoapp2/screens/add_task_screen.dart';
import 'package:todoapp2/screens/all_tasks.dart';
import 'package:todoapp2/screens/complete_screen.dart';
import 'package:todoapp2/shared/app_color.dart';
import 'package:todoapp2/shared/app_string.dart';
import 'package:todoapp2/shared/app_style.dart';
import 'package:todoapp2/shared/cash.dart';
import 'package:todoapp2/shared/constants.dart';
import 'package:todoapp2/shared/routes.dart';

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
  var alert = const AlertDialog(
    content: Center(
      child: Text("AlertDialog"),
    ),
  );
  //bloc cubit
  //provider
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        title: Text(screens[currentIndex]['title'], style: AppStyle.largeStyle),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: AppColor.appBarColor,
        onPressed: () async {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddTaskScreen()));
          // CashHelper.putData(
          //   key: "ThemeMode",
          //   value: true,
          // ).then((value) {
          //   print("ThemeMode has inserted");
          // });
          // CashHelper.sharedPreferences.remove("ThemeMode").then((value) {
          //   print("Key has removed");
          // });
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
