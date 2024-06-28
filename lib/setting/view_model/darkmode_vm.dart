import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treadchallange/setting/model/darkmode_config_model.dart';
import 'package:treadchallange/setting/repo/darkmode_repo.dart';

final darkmodeViewModelProvider =
    NotifierProvider<DarkmodeViewModel, ThemeMode>(
  () => DarkmodeViewModel(),
);

class DarkmodeViewModel extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return ref.watch(themeDarkModeProvider);
  }

  void switchThemeMode(ThemeMode mode) {
    ref.read(themeDarkModeProvider.notifier).switchThemeMode(mode);
  }
}




















// class DarkModeConfigViewModel extends ChangeNotifier {
//   final DarkModeConfigModel themeModeService;
//   DarkModeConfigViewModel({required this.themeModeService}) {
//     themeModeService.addListener(_themeModeListener);
//   }

//   late ThemeMode _currentThemeMode = themeModeService.themeDarkMode;

//   void _themeModeListener() {
//     _currentThemeMode = themeModeService.themeDarkMode;
//     notifyListeners();
//   }

//   @override
//   void dispose() {
//     themeModeService.removeListener(_themeModeListener);
//     super.dispose();
//   }

//   ThemeMode get currentThemeMode => _currentThemeMode;
//   String get currentAppearanceTitle => appearanceTitle(currentThemeMode);

//   String appearanceTitle(ThemeMode mode) => switch (mode) {
//         ThemeMode.system => "System",
//         ThemeMode.light => "Light",
//         ThemeMode.dark => "Dark",
//       };

//   void switchThemeMode(ThemeMode mode) {
//     themeModeService.switchThemeMode(mode);
//   }

// 맨처음 생각한 버튼식으로 bool값으로 다크모드를 컨트롤 할수 잇게 하려다 실패
  // late final DarkModeConfigModel _model = DarkModeConfigModel(
  //   isDark: _repository.isDark(),
  // );

  // bool get darkMode => _model.isDark;

  // void setDark(bool value) {
  //   _repository.setDarkMode(value);
  //   _model.isDark = value;
  //   notifyListeners();
  // }
// }
