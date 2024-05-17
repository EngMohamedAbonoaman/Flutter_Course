import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todoapp2/networking/DB.dart';
import 'package:todoapp2/shared/app_color.dart';
import 'package:todoapp2/shared/app_style.dart';
import 'package:todoapp2/shared/fixed_size.dart';
import 'package:todoapp2/state/add_task_cubit/add_task_cubit.dart';
import 'package:todoapp2/state/add_task_cubit/add_task_states.dart';

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
  @override
  void initState() {
    super.initState();
  }

  //
  // @override
  // void initState() {
  //   DBRepo.executeQuery("tasks").then((value) {
  //     myList = value;
  //     print(myList.length);
  //   });
  //
  //   // DBRepo.myList =
  //   //     tasks.where((element) => element['incomplete'] == false).toList();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    print(BlocProvider.of<AddTaskCubit>(context).myList.length);
    return BlocConsumer<AddTaskCubit, AllAddTaskStates>(
      builder: (BuildContext context, state) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: BlocProvider.of<AddTaskCubit>(context).myList.length,
          itemBuilder: (context, index) {
            return BuildTaskItem(
              title: BlocProvider.of<AddTaskCubit>(context).myList[index]
                  ['title'],
              description: BlocProvider.of<AddTaskCubit>(context).myList[index]
                  ['description'],
              status: BlocProvider.of<AddTaskCubit>(context).myList[index]
                  ['status'],
            );
          },
        );
      },
      listener: (BuildContext context, Object? state) {
        if (state is AddTaskSuccessState) {
          print("Success");
        } else if (state is AddTaskLoadingState) {
          print("Loading");
        }
      },
    );
  }
}
