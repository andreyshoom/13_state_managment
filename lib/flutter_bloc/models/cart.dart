import 'package:flutter_bloc/flutter_bloc.dart';

enum CartEvent {
  add,
  remove,
}

class CartBloc extends Bloc<CartEvent, dynamic> {
  CartBloc() : super([]);

  final List<int> _cartList = [];
  List<int> get items => _cartList;

  @override
  Stream<dynamic> mapEventToState(CartEvent event) async* {
    if (event == CartEvent.add) {
      // _cartList.add();
    }
    if (event == CartEvent.remove) {
      _cartList.remove(items);
    }
    yield _cartList;
  }
}
