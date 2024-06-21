import 'package:flutter/material.dart';

import '../shared/fixed_size.dart';

class BuildTextField extends StatelessWidget {
  BuildTextField(
      {super.key,
      required this.hint,
      required this.validate,
      required this.padding,
      required this.controller});
  String hint;
  Function validate;
  double padding;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.padding4),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          validate;
        },
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: padding, horizontal: 10),
          hintText: hint,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.send,
              color: Colors.blue,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
