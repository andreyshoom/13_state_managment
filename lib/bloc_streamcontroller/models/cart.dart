import 'dart:async';

abstract class CartEvent {}

class CartAdd extends CartEvent {
  final int itemAdd;

  CartAdd(this.itemAdd);
}

class CartRemove extends CartEvent {
  final int itemRemove;

  CartRemove(this.itemRemove);
}

class CartBloc {
  List<int> cartList = [];
  List<int> get items => cartList;

  final _stateController = StreamController<List<int>>();
  final _eventController = StreamController<CartEvent>();

  Stream<List<int>> get state => _stateController.stream;
  Sink<CartEvent> get action => _eventController.sink;

  CartBloc() {
    _eventController.stream.listen(_handleEvent);
  }

  void dispode() {
    _stateController.close();
    _eventController.close();
  }

  void _handleEvent(CartEvent action) {
    if (action is CartAdd) {
      cartList.add(action.itemAdd);
    }
    if (action is CartRemove) {
      cartList.remove(action.itemRemove);
    }

    _stateController.add(cartList);
  }
}
