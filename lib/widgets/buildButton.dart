import 'package:flutter/material.dart';

import '../shared/app_color.dart';
import '../shared/app_style.dart';

class BuildButton extends StatelessWidget {
  BuildButton(
      {super.key, this.width = 0, required this.text, required this.onTap});
  double width;
  String text;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            AppColor.primaryColor,
          ),
        ),
        onPressed: () => onTap(),
        child: Text(
          text,
          style: AppStyle.smallStyle.copyWith(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
