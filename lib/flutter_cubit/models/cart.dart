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

class CartCubit extends Cubit<List<int>> {
  final List<int> cartList;
  List<int> get items => cartList;

  CartCubit(this.cartList) : super([]);

  void addCart(int itemAdd) {
    emit([...cartList..add(itemAdd)]);
  }

  void removeCart(int itemRemove) {
    emit([...cartList..remove(itemRemove)]);
  }
}
