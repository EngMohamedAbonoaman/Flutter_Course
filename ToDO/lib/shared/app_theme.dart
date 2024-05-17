import 'package:flutter/material.dart';

ThemeData getAppTheme() {
  return ThemeData(
      //main colors
      primaryColor: Colors.black,
      primaryColorLight: Colors.white,
      primaryColorDark: Colors.black,
      disabledColor: Colors.grey,
      splashColor: Colors.red,

      //card theme
      cardTheme: const CardTheme(
        color: Colors.grey,
        elevation: 30,
        shadowColor: Colors.black,
      ),
      appBarTheme: AppBarTheme(),
      buttonTheme: ButtonThemeData(splashColor: Colors.red)
      //app bar theme

      // button theme

      //input decoration theme

      );
}
