import 'package:flutter/material.dart';
import 'package:todoapp2/screens/edit_screen.dart';

import '../shared/app_color.dart';
import '../shared/app_style.dart';
import '../shared/fixed_size.dart';

class BuildTaskItem extends StatelessWidget {
  BuildTaskItem(
      {super.key,
      required this.title,
      required this.details,
      this.isComplete = false});
  String title;
  String details;
  bool isComplete;

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
                    "Title",
                    style: AppStyle.mediumStyle
                        .copyWith(color: AppColor.appBarColor),
                  ),
                  Text(
                    "Sub Title",
                    style: AppStyle.smallStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              isComplete
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
                              builder: (context) => const EditScreen(),
                            ));
                          },
                          icon: const Icon(
                            Icons.edit,
                            size: 25,
                          ),
                          color: Colors.deepOrange,
                        ),
                        IconButton(
                          onPressed: () {},
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
