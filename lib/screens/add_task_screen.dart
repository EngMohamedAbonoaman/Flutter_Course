import 'package:flutter/material.dart';
import 'package:todoapp2/shared/app_color.dart';
import 'package:todoapp2/shared/app_style.dart';
import 'package:todoapp2/shared/fixed_size.dart';
import 'package:todoapp2/widgets/buildButton.dart';
import 'package:todoapp2/widgets/buildtextfield.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Task Details",
              style: AppStyle.mediumStyle,
            ),
            BuildTextField(
              hint: "Enter task title...",
              validate: () {},
              padding: 10,
            ),
            BuildTextField(
              hint: "Enter task details...",
              validate: () {},
              padding: 70,
            ),
            BuildButton(
              width: double.infinity,
              text: "Add",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
