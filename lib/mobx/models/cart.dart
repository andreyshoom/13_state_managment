import 'package:mobx/mobx.dart';

part 'cart.g.dart';

class CartState = _CartState with _$CartState;

abstract class _CartState with Store {
  @observable
  List<int> cartList = [];

  @action
  void addItem(int item) {
    List<int> newList = [];
    newList.addAll(cartList);
    newList.add(item);
    cartList = newList;
  }

  @action
  void removeItem(int item) {
    List<int> newList = [];
    newList.addAll(cartList);
    newList.remove(item);
    cartList = newList;
  }
}
