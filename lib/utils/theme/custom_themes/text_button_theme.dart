import 'package:flutter/material.dart';

class ETextButtonTheme {
  ETextButtonTheme._();
  static const lightTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.black))
    )
  );

  static const darkTextButtonTheme = TextButtonThemeData(
        style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white))
    )
  );
}
