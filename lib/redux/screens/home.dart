import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_managment/redux/models/cart.dart';
import 'package:state_managment/redux/screens/cart.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page Redux'),
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

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key, required this.itemNum}) : super(key: key);

  final int itemNum;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<CartState, List<int>>(
      converter: (store) => store.state.cartList,
      builder: (context, cart) {
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
                  icon: cart.contains(itemNum)
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                        )
                      : const Icon(Icons.add_circle_outline_sharp),
                  onPressed: () {
                    !cart.contains(itemNum)
                        ? store.dispatch(CartAddAction(itemAdd: itemNum))
                        : store.dispatch(CartRemoveAction(itemRemove: itemNum));
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
      },
    );
  }
}
