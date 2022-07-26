import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_managment/redux/models/cart.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  static const String routeName = '/cart';
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: StoreConnector<CartState, List<int>>(
          converter: (store) => store.state.cartList,
          builder: (context, cart) => ListView.builder(
            itemBuilder: (context, index) => CartView(itemNumber: cart[index]),
            itemCount: cart.length,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
        ));
  }
}

class CartView extends StatelessWidget {
  const CartView({Key? key, required this.itemNumber}) : super(key: key);
  final itemNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StoreConnector<CartState, List<int>>(
          converter: (store) => store.state.cartList,
          builder: (context, cart) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('items $itemNumber'),
              trailing: IconButton(
                onPressed: (() {
                  store.dispatch(CartRemoveAction(itemRemove: itemNumber));
                }),
                icon: const Icon(
                  Icons.remove_circle_outlined,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
        const Divider(
          height: 1.0,
          color: Colors.black26,
        )
      ],
    );
  }
}
