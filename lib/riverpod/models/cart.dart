import 'package:flutter_riverpod/flutter_riverpod.dart';

class Cart extends StateNotifier {
  Cart() : super([]);

  final List<int> _cartList = [];

  List<int> get items => _cartList;

  void add(int item) => _cartList.add(item);

  void remove(int item) => _cartList.remove(item);
}

final cartProvider = StateNotifierProvider((_) {
  return Cart();
});
