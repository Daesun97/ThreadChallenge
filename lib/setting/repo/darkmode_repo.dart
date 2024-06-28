import 'package:shared_preferences/shared_preferences.dart';

class DarkModeConfigRepository {
  static const String _isDark = 'isDark';

  final SharedPreferences _preferences;
  DarkModeConfigRepository(this._preferences);

  Future<void> setDarkMode(bool value) async {
    _preferences.setBool(_isDark, value);
  }

  bool isDark() {
    return _preferences.getBool(_isDark) ?? false;
  }
}
