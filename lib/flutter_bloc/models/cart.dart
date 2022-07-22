import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CartEvent {}

class CartAdd extends CartEvent {
  final int itemAdd;

  CartAdd(this.itemAdd);
}

class CartRemove extends CartEvent {
  final int itemRemove;

  CartRemove(this.itemRemove);
}

class CartBloc extends Bloc<CartEvent, List<int>> {
  final List<int> cartList;

  List<int> get items => cartList;

  CartBloc(this.cartList) : super([]) {
    on<CartAdd>((event, emit) {
      emit([...cartList..add(event.itemAdd)]);
    });
    on<CartRemove>((event, emit) {
      emit([...cartList..remove(event.itemRemove)]);
    });
  }
}
