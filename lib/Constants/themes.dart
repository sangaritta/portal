import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Themes {
  static final lightTheme = ThemeData(
      fontFamily: "Medium",
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.black,
      shadowColor: Colors.grey[350],
      cardColor: const Color(0xffececec),
      dividerColor: Colors.grey[500],
      highlightColor: const Color(0xFFC9C9C9),
      hintColor: const Color(0xFFF3F3F3),
      primaryColorDark: Colors.grey[500], colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue,).copyWith(background: Colors.white)
      );

  static final darkTheme = ThemeData(
    fontFamily: "Medium",
      useMaterial3: true,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    hintColor: const Color(0xFF161616),
    cupertinoOverrideTheme:
        const CupertinoThemeData(brightness: Brightness.dark),
    scaffoldBackgroundColor: const Color.fromARGB(255, 15, 15, 16),
    primaryColor: Colors.white,
    shadowColor: const Color.fromARGB(255, 35, 35, 36),
    cardColor: const Color.fromARGB(255, 53, 53, 55),
    highlightColor: const Color(0xFF323232),
    dividerColor: Colors.grey[800],
    primaryColorDark: Colors.grey[500], colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: const Color.fromARGB(255, 35, 35, 36)),
  );
}
