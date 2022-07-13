import 'package:state_managment/simple_state_managment/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  static const String routeName = '/cart';
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<Cart>(
        builder: (context, value, child) => ListView.builder(
          itemBuilder: (context, index) =>
              CartView(itemNumber: value.items[index]),
          itemCount: value.items.length,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
      ),
    );
  }
}

class CartView extends StatelessWidget {
  const CartView({Key? key, required this.itemNumber}) : super(key: key);
  final itemNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text('items $itemNumber'),
            trailing: IconButton(
              onPressed: (() {
                context.read<Cart>().remove(itemNumber);
              }),
              icon: const Icon(
                Icons.remove_circle_outlined,
                color: Colors.red,
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
