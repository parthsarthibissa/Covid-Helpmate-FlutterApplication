import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _pref;
  bool _darkTheme;
  bool get darkTheme => _darkTheme;
  ThemeNotifier() {
    _darkTheme = true;
  }
  toggleTheme(){
    _darkTheme = !_darkTheme;
    notifyListeners();
  }
}