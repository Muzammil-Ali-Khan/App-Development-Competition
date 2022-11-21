import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier {
  String? theme = "Light Theme";

  setTheme(String value) {
    theme = value;
    notifyListeners();
  }
}
