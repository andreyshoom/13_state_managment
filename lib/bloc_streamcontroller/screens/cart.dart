import 'package:state_managment/bloc_streamcontroller/models/cart.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  static const String routeName = '/cart';
  const CartPage({Key? key, required this.bloc}) : super(key: key);
  final CartBloc bloc;
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
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('items ${bloc.cartList[index]}'),
                  trailing: IconButton(
                    onPressed: (() {
                      bloc.action.add(CartRemove(bloc.cartList[index]));
                    }),
                    icon: const Icon(
                      Icons.remove_circle_outlined,
                      color: Colors.red,
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
        },
      ),
    );
  }
}
