import 'package:flutter/material.dart';

class RouterNotifier extends ChangeNotifier {
  bool shouldAddEvent = false;

  void changeShouldAddEvent({
    required bool value,
    bool notify = true,
  }) {
    shouldAddEvent = value;
    if (notify) notifyListeners();
  }
}
