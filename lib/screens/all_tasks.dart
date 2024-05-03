import 'package:flutter/material.dart';
import 'package:todoapp2/shared/app_color.dart';
import 'package:todoapp2/shared/app_style.dart';
import 'package:todoapp2/shared/fixed_size.dart';
import 'package:todoapp2/widgets/buildTaskItem.dart';

class AllTasksScreen extends StatefulWidget {
  AllTasksScreen({super.key});

  @override
  State<AllTasksScreen> createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  List<Map<String, dynamic>> tasks = [
    {
      'title': "Dart",
      'sub title': "Dart exam on variables",
      'incomplete': false
    },
    {
      'title': "Flutter task",
      'sub title': "Flutter Todo app",
      'incomplete': true
    },
    {
      'title': "OOP",
      'sub title': "OOP exam on classes",
      'incomplete': false,
    },
  ];

  List<Map<String, dynamic>> myList = [];

  @override
  void initState() {
    myList = tasks.where((element) => element['incomplete'] == false).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: myList.length,
      itemBuilder: (context, index) {
        return BuildTaskItem(
          title: myList[index]['title'],
          details: myList[index]['sub title'],
          isComplete: myList[index]['incomplete'],
        );
      },
    );
  }
}
