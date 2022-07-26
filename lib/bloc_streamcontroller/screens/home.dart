import 'package:flutter/material.dart';
import 'package:state_managment/bloc_streamcontroller/models/cart.dart';
import 'package:state_managment/bloc_streamcontroller/screens/cart.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

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
        ),
      ),
    );
  }
}

class ItemsView extends StatefulWidget {
  const ItemsView({Key? key, required this.itemNum}) : super(key: key);

  final int itemNum;
  @override
  State<ItemsView> createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  late final CartBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: bloc.state,
            builder: (context, snapshot) {
              return ListTile(
                leading: Icon(
                  Icons.bakery_dining_outlined,
                  color: Colors
                      .primaries[widget.itemNum % Colors.primaries.length],
                ),
                title: Text('item ${widget.itemNum}'),
                trailing: IconButton(
                  icon: bloc.cartList.contains(widget.itemNum)
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                        )
                      : const Icon(Icons.add_circle_outline_sharp),
                  onPressed: () {
                    print(widget.itemNum);
                    !bloc.cartList.contains(widget.itemNum)
                        ? bloc.action.add(CartAdd(widget.itemNum))
                        : bloc.action.add(CartRemove(widget.itemNum));
                  },
                ),
              );
            },
          ),
        ),
        const Divider(
          height: 4.0,
          color: Colors.black26,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    bloc = CartBloc([]);
  }

  @override
  void dispose() {
    bloc.dispode();
    super.dispose();
  }
}
