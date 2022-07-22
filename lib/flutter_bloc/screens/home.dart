import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/flutter_bloc/models/cart.dart';
import 'package:state_managment/flutter_bloc/screens/cart.dart';

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
    final cart = context.read<CartBloc>();
    return Column(
      children: [
        BlocBuilder<CartBloc, List<int>>(
          builder: (context, state) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(
                Icons.bakery_dining_outlined,
                color: Colors.primaries[itemNum % Colors.primaries.length],
              ),
              title: Text('item $itemNum'),
              trailing: IconButton(
                icon: state.contains(itemNum)
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.blue,
                      )
                    : const Icon(Icons.add_circle_outline_sharp),
                onPressed: () {
                  !state.contains(itemNum)
                      ? cart.add(CartAdd(itemNum))
                      : cart.add(CartRemove(itemNum));
                },
              ),
              onTap: () {},
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
