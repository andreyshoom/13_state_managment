import 'package:hooks_riverpod/hooks_riverpod.dart';

class Cart {
  Cart({required this.item});
  final int item;
}

class CartNotifier extends StateNotifier<List<int>> {
  CartNotifier() : super([]);

  void addCart(int itemToAdd) {
    state = [...state, itemToAdd];
  }

  void removeCart(int itemToRemove) {
    state = [
      for (final item in state)
        if (item != itemToRemove) item,
    ];
  }
}

final cartProviderHooks =
    StateNotifierProvider<CartNotifier, List<int>>((ref) => CartNotifier());
