import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final GetStorage _box = GetStorage();

  bool get isDarkMode => _box.read('isDarkMode') ?? false;

  ThemeMode getSavedTheme() {
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    bool currentMode = isDarkMode;
    bool newMode = !currentMode;

    _box.write('isDarkMode', newMode);

    Get.changeThemeMode(newMode ? ThemeMode.dark : ThemeMode.light);
    update();
  }
}
