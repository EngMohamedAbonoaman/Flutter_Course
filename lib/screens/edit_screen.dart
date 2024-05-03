import 'package:flutter/material.dart';

import '../shared/app_color.dart';
import '../shared/app_style.dart';
import '../shared/fixed_size.dart';
import '../widgets/buildButton.dart';
import '../widgets/buildtextfield.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        title: const Text(
          "Edit Task",
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
            Padding(
              padding: const EdgeInsets.only(top: AppSize.padding3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BuildButton(
                    width: MediaQuery.of(context).size.width * .4,
                    text: "Edit",
                    onTap: () {},
                  ),
                  BuildButton(
                    width: MediaQuery.of(context).size.width * .4,
                    text: "Cancel",
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
