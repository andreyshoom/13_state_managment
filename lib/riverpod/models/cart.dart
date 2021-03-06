import 'package:flutter_riverpod/flutter_riverpod.dart';

class Cart {
  Cart({required this.item});
  final int item;

  @override
  List<Object> get props => [item];
}

class CartNotifier extends StateNotifier<List<int>> {
  CartNotifier() : super([]);

  void addCart(int item) {
    state = [...state, item];
  }

  void removeCart(int itemToRemove) {
    state = [
      for (final item in state)
        if (item != itemToRemove) item,
    ];
  }
}

final cartProvider =
    StateNotifierProvider<CartNotifier, List<int>>((ref) => CartNotifier());
