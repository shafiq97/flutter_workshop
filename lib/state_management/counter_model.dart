// counter_model.dart

import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // Notifies all the listeners about the change.
  }
}
