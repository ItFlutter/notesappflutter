import 'package:flutter/material.dart';
import 'package:notesapp/core/constant/color.dart';

ThemeData? theme = ThemeData(
    appBarTheme:
        const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0.0),
    canvasColor: AppColor.backgroundColor,
    scaffoldBackgroundColor: AppColor.backgroundColor,
    fontFamily: "Nunito",
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xff151515)));
