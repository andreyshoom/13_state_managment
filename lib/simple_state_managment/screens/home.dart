import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/simple_state_managment/models/cart.dart';
import 'package:state_managment/simple_state_managment/screens/cart.dart';

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

class ItemaView extends StatelessWidget {
  const ItemaView({Key? key, required this.itemNum}) : super(key: key);

  final int itemNum;
  @override
  Widget build(BuildContext context) {
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
              icon: context.watch<Cart>().items.contains(itemNum)
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                    )
                  : const Icon(Icons.add_circle_outline_sharp),
              onPressed: () {
                !context.read<Cart>().items.contains(itemNum)
                    ? context.read<Cart>().add(itemNum)
                    : context.read<Cart>().remove(itemNum);
              },
            ),
            onTap: () {},
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
