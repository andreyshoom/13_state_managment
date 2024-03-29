import 'package:provider/provider.dart';
import 'package:state_managment/mobx/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CartPage extends StatelessWidget {
  static const String routeName = '/cart';
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CartState>(context);

    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) =>
                CartView(itemNumber: state.cartList[index]),
            itemCount: state.cartList.length,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
        );
      },
    );
  }
}

class CartView extends StatelessWidget {
  const CartView({Key? key, required this.itemNumber}) : super(key: key);
  final itemNumber;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CartState>(context);

    return Column(
      children: [
        Observer(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('items $itemNumber'),
              trailing: IconButton(
                onPressed: (() {
                  state.removeItem(itemNumber);
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
