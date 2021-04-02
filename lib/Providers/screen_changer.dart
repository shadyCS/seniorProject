import 'package:flutter/material.dart';

class ScreenChanger with ChangeNotifier {
  int screenIndex = 0;
  int barIndex = 0;
  List<int> history = [0];

  void changeIndex(int index) {
    screenIndex = index;
    history.add(screenIndex);
    barIndex = index < 5 ? barIndex = index : barIndex;
    notifyListeners();
  }

  int get index {
    return screenIndex;
  }

  int get navIndex {
    return barIndex;
  }

  void goBack() {
    history.removeLast();
    screenIndex = history[history.length - 1];
    barIndex = screenIndex < 5 ? barIndex = screenIndex : barIndex;
    notifyListeners();
  }
}
