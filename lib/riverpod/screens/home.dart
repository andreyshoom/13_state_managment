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
        title: const Text('Home Page'),
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
        itemBuilder: (context, index) => ItemaView(itemNum: index),
      ),
    );
  }
}

class ItemaView extends ConsumerWidget {
  const ItemaView({Key? key, required this.itemNum}) : super(key: key);

  final int itemNum;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(cartProvider.notifier);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(
              Icons.bakery_dining_outlined,
              color: Colors.primaries[itemNum % Colors.primaries.length],
            ),
            title: Text('item $itemNum'),
            trailing: IconButton(
              icon: provider.state.contains(itemNum)
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                    )
                  : const Icon(Icons.add_circle_outline_sharp),
              onPressed: () {
                !provider.state.contains(itemNum)
                    ? provider.add(itemNum)
                    : provider.remove(itemNum);
              },
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
