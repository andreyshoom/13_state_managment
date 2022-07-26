import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';

class Actions {}

class CartAddAction extends Actions {
  final int itemAdd;
  CartAddAction({required this.itemAdd});
}

class CartRemoveAction extends Actions {
  final int itemRemove;
  CartRemoveAction({required this.itemRemove});
}

class CartState extends Equatable {
  List<int> cartList = [];

  @override
  List<Object?> get props => cartList;

  CartState({required this.cartList});
}

CartState cartReducer(CartState state, dynamic action) {
  if (action is CartAddAction) {
    List<int> updatedCart = [];
    updatedCart.addAll(state.cartList);
    updatedCart.add(action.itemAdd);
    return CartState(cartList: updatedCart);
  }
  if (action is CartRemoveAction) {
    List<int> updatedCart = [];
    updatedCart.addAll(state.cartList);
    updatedCart.remove(action.itemRemove);
    return CartState(cartList: updatedCart);
  }
  return state;
}

final store = Store<CartState>(
  cartReducer,
  initialState: CartState(cartList: []),
);
