import 'package:flutter_riverpod/flutter_riverpod.dart';

class Cart {
  final List<int> _cartList = [];

  List<int> get items => _cartList;
}

class CartNotifier extends StateNotifier<List<int>> {
  CartNotifier() : super([]);

  void add(int item) {
    state = [...state, item];
    // _cartList.add(item);
  }

  void remove(int items) {
    state = [
      for (final item in state)
        if (item != items) item,
    ];
  }
}

final cartProvider = StateNotifierProvider((_) => CartNotifier());
