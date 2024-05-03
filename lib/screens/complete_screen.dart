import 'package:flutter/material.dart';

import '../widgets/buildTaskItem.dart';

class CompleteScreen extends StatefulWidget {
  CompleteScreen({super.key});

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
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
    myList = tasks.where((element) => element['incomplete'] == true).toList();
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
