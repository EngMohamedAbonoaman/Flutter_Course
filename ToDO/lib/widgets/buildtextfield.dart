import 'package:flutter/material.dart';

import '../shared/fixed_size.dart';

class BuildTextField extends StatelessWidget {
  BuildTextField(
      {super.key,
      required this.hint,
      required this.validate,
      required this.padding});
  String hint;
  Function validate;
  double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.padding4),
      child: TextFormField(
        validator: (value) {
          validate;
        },
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: padding, horizontal: 10),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
