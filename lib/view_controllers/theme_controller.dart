import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/cache_helper.dart';

class ThemeController extends GetxController {
  late bool _isDark;
  ThemeMode? initialThemeMode;

  changeAppThemeMode() async {
    _isDark = !_isDark;
    await CacheHelper.putData(key: 'isDark', value: _isDark);
    _isDark ? Get.changeThemeMode(ThemeMode.dark) : Get.changeThemeMode(ThemeMode.light);
  }

  getInitialTheme() {
    _isDark ? initialThemeMode = ThemeMode.dark : initialThemeMode = ThemeMode.light;
  }

  @override
  void onInit() async {
    _isDark = await CacheHelper.getData(key: 'isDark') ?? false;
    getInitialTheme();
    super.onInit();
  }
}
