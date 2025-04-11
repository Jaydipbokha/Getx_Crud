import 'package:flutter/material.dart';

class AppColor {
  static final AppColor _instance = AppColor._internal();

  AppColor._internal();

  factory AppColor() {
    return _instance;
  }

  static Color themeColor = Color.fromARGB(255, 72, 164, 240);
  static Color whiteColor = Color(0xFFFFFFFF);
  static Color blackColor = Color(0xFF000000);
  static Color greyColor = Colors.grey;
}
