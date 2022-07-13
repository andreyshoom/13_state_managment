import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/riverpod/models/cart.dart';
import 'package:flutter/material.dart';

class CartPage extends ConsumerWidget {
  static const String routeName = '/cart';
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return ListView.builder(
            itemBuilder: (context, index) => CartView(
                itemNumber: ref.watch(cartProvider.notifier).items[index]),
            itemCount: ref.watch(cartProvider.notifier).items.length,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          );
        },
      ),
    );
  }
}

class CartView extends ConsumerWidget {
  const CartView({Key? key, required this.itemNumber}) : super(key: key);
  final itemNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(cartProvider.notifier);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text('items $itemNumber'),
            trailing: IconButton(
              onPressed: (() {
                provider.remove(itemNumber);
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
