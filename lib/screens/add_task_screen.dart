import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todoapp2/networking/DB.dart';
import 'package:todoapp2/shared/app_color.dart';
import 'package:todoapp2/shared/app_style.dart';
import 'package:todoapp2/shared/fixed_size.dart';

import 'package:todoapp2/widgets/buildButton.dart';
import 'package:todoapp2/widgets/buildtextfield.dart';

import '../state/add_task_cubit/add_task_cubit.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool isLoading = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController idController = TextEditingController();

  TextEditingController desController = TextEditingController();
  @override
  void dispose() {
    idController.clear();
    titleController.clear();
    desController.clear();
    super.dispose();
  }

  var alert = AlertDialog(
    backgroundColor: Colors.white,
    title: Text("Task"),
    elevation: 30,
    contentPadding: EdgeInsets.all(20),
    content: Container(
      child: Center(
        child: Text("Task added successfully"),
      ),
    ),
  );

  // loading state => error state => success state
  var snack = const SnackBar(
      dismissDirection: DismissDirection.startToEnd,
      content: Center(
        child: Text("Task Added successfully "),
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        title: const Text(
          "Add Task",
          style: AppStyle.largeStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSize.padding1),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Task Details",
                style: AppStyle.mediumStyle,
              ),
              BuildTextField(
                controller: idController,
                hint: "ID",
                validate: () {},
                padding: 10,
              ),
              BuildTextField(
                controller: titleController,
                hint: "Enter task title...",
                validate: () {},
                padding: 10,
              ),
              BuildTextField(
                controller: desController,
                hint: "Enter task details...",
                validate: () {},
                padding: 70,
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : BuildButton(
                      width: double.infinity,
                      text: "Add",
                      onTap: () {
                        setState(() {
                          isLoading = true;
                        });
                        BlocProvider.of<AddTaskCubit>(context)
                            .insert(
                          id: int.parse(idController.text),
                          title: titleController.text,
                          description: desController.text,
                          status: 0,
                        )
                            .then((value) {
                          setState(() {
                            isLoading = false;
                          });

                          // Fluttertoast.showToast(
                          //     msg: "Task added successfully",
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.BOTTOM,
                          //     timeInSecForIosWeb: 1,
                          //     backgroundColor: Colors.black.withOpacity(0.2),
                          //     textColor: Colors.green,
                          //     fontSize: 16.0);
                          idController.clear();
                          titleController.clear();
                          desController.clear();
                          // showDialog(
                          //   context: context,
                          //   builder: (context) => alert,
                          // );
                          ScaffoldMessenger.of(context).showSnackBar(snack);
                          Navigator.pop(context);
                        });
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
