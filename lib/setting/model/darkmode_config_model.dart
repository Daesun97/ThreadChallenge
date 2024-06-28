import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treadchallange/setting/view_model/darkmode_vm.dart';

class DarkModeConfigModel extends Notifier<ThemeMode> {
  // var _themeDarkMode = ThemeMode.system;

  // ThemeMode get themeDarkMode => _themeDarkMode;

  // void switchThemeMode(ThemeMode mode) {
  //   _themeDarkMode = mode;
  //   notifyListeners();
  // }

  void switchThemeMode(ThemeMode mode) {
    state = mode;
  }

//초기값
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }
}

final themeDarkModeProvider = NotifierProvider<DarkModeConfigModel, ThemeMode>(
  () => DarkModeConfigModel(),
);
