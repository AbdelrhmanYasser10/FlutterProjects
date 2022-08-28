import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = "isDarkMode";

  void _saveThemeToBox({required bool isDarkMode})=> _box.write(_key, isDarkMode);
  //if there's a value return this value else return false
  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  //return the dark theme if it is true else return the light theme
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  //Switch theme using getX
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(isDarkMode: !_loadThemeFromBox());
  }
}
