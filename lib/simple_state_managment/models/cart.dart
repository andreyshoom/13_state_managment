import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final List<int> _cartList = [];

  List<int> get items => _cartList;

  void add(int item) {
    _cartList.add(item);
    notifyListeners();
  }

  void remove(int item) {
    _cartList.remove(item);
    notifyListeners();
  }
}
