import 'package:flutter/material.dart';

// Extends ChangeNotifier in order to notify the page when amount changes
class Counter extends ChangeNotifier {
  int _amount = 0;
  int get amount => _amount;

  void increment() {
    _amount++;
    notifyListeners();
  }

  void decrease() {
    _amount--;
    notifyListeners();
  }

  void resetCounter() {
    _amount = 0;
    notifyListeners();
  }
}
