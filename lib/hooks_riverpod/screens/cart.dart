import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_managment/hooks_riverpod/models/cart.dart';

class CartPage extends HookConsumerWidget {
  static const String routeName = '/cart';
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemWatch = ref.watch(cartProviderHooks);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => CartView(
          itemNumber: itemWatch[index],
        ),
        itemCount: itemWatch.length,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
      ),
    );
  }
}

class CartView extends HookConsumerWidget {
  const CartView({Key? key, required this.itemNumber}) : super(key: key);
  final itemNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartHook = ref.watch(cartProviderHooks);

    return Column(
      children: [
        HookConsumer(
          builder: (context, ref, child) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('item $itemNumber'),
              trailing: IconButton(
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: Colors.red,
                ),
                onPressed: () {
                  ref.read(cartProviderHooks.notifier).removeCart(itemNumber);
                },
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
