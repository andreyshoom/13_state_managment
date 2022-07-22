import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/riverpod/models/cart.dart';
import 'package:state_managment/riverpod/screens/cart.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page RiverPod'),
        actions: [
          IconButton(
            onPressed: (() {
              Navigator.pushNamed(context, CartPage.routeName);
            }),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 50,
        cacheExtent: 20.0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemsView(itemNum: index),
      ),
    );
  }
}

class ItemsView extends ConsumerWidget {
  const ItemsView({Key? key, required this.itemNum}) : super(key: key);

  final int itemNum;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final stateCart = ref.watch(cartProvider.notifier).state.contains(itemNum);
    final providerCart = ref.read(cartProvider.notifier);

    return Column(
      children: [
        Consumer(
          builder: (context, ref, child) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(
                Icons.bakery_dining_outlined,
                color: Colors.primaries[itemNum % Colors.primaries.length],
              ),
              title: Text('item $itemNum'),
              trailing: IconButton(
                icon: stateCart
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.blue,
                      )
                    : const Icon(Icons.add_circle_outline_sharp),
                onPressed: () {
                  !stateCart
                      ? providerCart.addCart(itemNum)
                      : providerCart.removeCart(itemNum);
                },
              ),
            ),
          ),
        ),
        const Divider(
          height: 4.0,
          color: Colors.black26,
        ),
      ],
    );
  }
}
