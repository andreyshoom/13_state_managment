import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CartEvent {
  add,
  remove,
}

class CartBloc extends Bloc<CartEvent, dynamic> {
  CartBloc() : super([]);

  final List<int> _cartList = [];

  @override
  Stream<dynamic> mapEventToState(CartEvent event, int item) async* {
    if (event == CartEvent.add) {
      _cartList.add(item);
    }
    if (event == CartEvent.remove) {
      _cartList.remove(item);
    }
    yield _cartList;
  }
}
