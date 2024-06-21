import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp2/screens/edit_screen.dart';
import 'package:todoapp2/state/add_task_cubit/task_cubit.dart';

import '../shared/app_color.dart';
import '../shared/app_style.dart';
import '../shared/fixed_size.dart';

class BuildTaskItem extends StatelessWidget {
  BuildTaskItem(
      {super.key,
      required this.id,
      required this.title,
      required this.description,
      this.status = 0});
  String title;
  int id;
  String description;
  int status;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSize.padding2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    title,
                    style: AppStyle.mediumStyle
                        .copyWith(color: AppColor.appBarColor),
                  ),
                  Text(
                    description,
                    style: AppStyle.smallStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              status == 1
                  ? const Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 25,
                    )
                  : Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditScreen(
                                id: id,
                                title: title,
                                desc: description,
                              ),
                            ));
                          },
                          icon: const Icon(
                            Icons.edit,
                            size: 25,
                          ),
                          color: Colors.deepOrange,
                        ),
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<TaskCubit>(context).delete(id: id);
                          },
                          icon: const Icon(
                            Icons.delete_outline,
                            size: 25,
                            color: Colors.red,
                          ),
                          color: Colors.deepOrange,
                        ),
                        IconButton(
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => const EditScreen(),
                            // ));
                          },
                          icon: const Icon(
                            Icons.check_box_outlined,
                            size: 25,
                          ),
                          color: Colors.green,
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
