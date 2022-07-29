import 'package:flutter/material.dart';
import 'package:state_managment/bloc_streamcontroller/models/cart.dart';
import 'package:state_managment/bloc_streamcontroller/screens/cart.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  const HomePage({Key? key, required this.bloc}) : super(key: key);
  final CartBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Bloc Stream Controller'),
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
        itemBuilder: (context, index) => ItemsView(
          itemNum: index,
          bloc: bloc,
        ),
      ),
    );
  }
}

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key, required this.itemNum, required this.bloc})
      : super(key: key);
  final int itemNum;
  final CartBloc bloc;
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
              icon: bloc.cartList.contains(itemNum)
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                    )
                  : const Icon(Icons.add_circle_outline_sharp),
              onPressed: () {
                !bloc.cartList.contains(itemNum)
                    ? bloc.action.add(CartAdd(itemNum))
                    : bloc.action.add(CartRemove(itemNum));
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
