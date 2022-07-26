import 'package:state_managment/bloc_streamcontroller/models/cart.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  static const String routeName = '/cart';
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = CartBloc([]).cartList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Bloc Stream Controller'),
      ),
      body: StreamBuilder(
          // stream: bloc.,
          builder: (context, snapshot) {
        return ListView.builder(
          itemBuilder: (context, index) => CartView(itemNumber: bloc[index]),
          itemCount: bloc.length,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        );
      }),
    );
  }
}

class CartView extends StatefulWidget {
  const CartView({Key? key, required this.itemNumber}) : super(key: key);

  final itemNumber;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late CartBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
            stream: bloc.state,
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('items ${widget.itemNumber}'),
                  trailing: IconButton(
                    onPressed: (() {
                      bloc.action.add(CartRemove(widget.itemNumber));
                    }),
                    icon: const Icon(
                      Icons.remove_circle_outlined,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            }),
        const Divider(
          height: 1.0,
          color: Colors.black26,
        )
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
