import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/mobx/models/cart.dart';
import 'package:state_managment/mobx/screens/cart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home Page MobX'),
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
      },
    );
  }
}

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key, required this.itemNum}) : super(key: key);

  final int itemNum;
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CartState>(context);
    return Observer(
      builder: (context) {
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
                  icon: state.cartList.contains(itemNum)
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                        )
                      : const Icon(Icons.add_circle_outline_sharp),
                  onPressed: () {
                    !state.cartList.contains(itemNum)
                        ? state.addItem(itemNum)
                        : state.removeItem(itemNum);
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
      },
    );
  }
}
