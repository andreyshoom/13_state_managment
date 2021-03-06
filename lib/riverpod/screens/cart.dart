import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/riverpod/models/cart.dart';
import 'package:flutter/material.dart';

class CartPage extends ConsumerWidget {
  static const String routeName = '/cart';
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => CartView(itemNumber: items[index]),
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
      ),
    );
  }
}

class CartView extends ConsumerWidget {
  const CartView({Key? key, required this.itemNumber}) : super(key: key);
  final itemNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(cartProvider);

    return Column(
      children: [
        Consumer(
          builder: (context, ref, child) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('items $itemNumber'),
              trailing: IconButton(
                onPressed: (() {
                  ref.read(cartProvider.notifier).removeCart(itemNumber);
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
