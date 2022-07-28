import 'package:state_managment/bloc_streamcontroller/models/cart.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  static const String routeName = '/cart';
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late CartBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Bloc Stream Controller'),
      ),
      body: ListView.builder(
        itemCount: bloc.cartList.length,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        itemBuilder: (context, index) {
          print('index: $index');
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: bloc.state,
              builder: (context, snapshot) => ListTile(
                title: Text('items $index'),
                trailing: IconButton(
                  onPressed: (() {
                    bloc.action.add(CartRemove(index));
                  }),
                  icon: const Icon(
                    Icons.remove_circle_outlined,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    bloc = CartBloc();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispode();
    super.dispose();
  }
}
