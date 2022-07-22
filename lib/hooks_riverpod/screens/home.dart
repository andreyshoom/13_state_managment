import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_managment/hooks_riverpod/models/cart.dart';
import 'package:state_managment/hooks_riverpod/screens/cart.dart';

class HomePage extends HookConsumerWidget {
  static const String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page Hooks riverpod'),
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.pushNamed(context, CartPage.routeName);
              }),
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView.builder(
        itemCount: 50,
        cacheExtent: 20.0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemsView(
          itemNumber: index,
        ),
      ),
    );
  }
}

class ItemsView extends HookConsumerWidget {
  const ItemsView({Key? key, required this.itemNumber}) : super(key: key);

  final int itemNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProviderHooks);
    final stateHooks =
        ref.watch(cartProviderHooks.notifier).state.contains(itemNumber);
    final providerHooks = ref.watch(cartProviderHooks.notifier);
    return Column(
      children: [
        HookConsumer(
          builder: (context, ref, child) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(
                Icons.bakery_dining_outlined,
                color: Colors.primaries[itemNumber % Colors.primaries.length],
              ),
              title: Text('Items $itemNumber'),
              trailing: IconButton(
                icon: stateHooks
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.blue,
                      )
                    : const Icon(Icons.add_circle_outline_sharp),
                onPressed: () {
                  !stateHooks
                      ? providerHooks.addCart(itemNumber)
                      : providerHooks.removeCart(itemNumber);
                },
              ),
            ),
          ),
        ),
        const Divider(
          height: 4.0,
          color: Colors.black26,
        )
      ],
    );
  }
}
