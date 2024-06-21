import 'package:flutter/material.dart';
import 'package:todoapp2/networking/DB.dart';

import '../shared/app_color.dart';
import '../shared/app_style.dart';
import '../shared/fixed_size.dart';
import '../widgets/buildButton.dart';
import '../widgets/buildtextfield.dart';

class EditScreen extends StatefulWidget {
  EditScreen(
      {super.key, required this.title, required this.desc, required this.id});
  int id;
  String title;
  String desc;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController idController = TextEditingController();

  TextEditingController desController = TextEditingController();

  void setController() {
    idController.text = widget.id.toString();
    titleController.text = widget.title;
    desController.text = widget.desc;
  }

  @override
  void initState() {
    setController();
    super.initState();
  }

  bool isLoading = false;

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
                hint: "Task ID",
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
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: AppSize.padding3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BuildButton(
                            width: MediaQuery.of(context).size.width * .4,
                            text: "Edit",
                            onTap: () {
                              setState(() {
                                isLoading = true;
                              });
                              DBRepo.update(
                                id: int.parse(idController.text),
                                title: titleController.text,
                                description: desController.text,
                                status: 1,
                              ).then((value) {
                                setState(() {
                                  isLoading = false;
                                });
                              });
                            },
                          ),
                          BuildButton(
                            width: MediaQuery.of(context).size.width * .4,
                            text: "Cancel",
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
