import 'package:state_managment/bloc_streamcontroller/models/cart.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  static const String routeName = '/cart';
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // late CartBloc bloc;

  @override
  Widget build(BuildContext context) {
    final bloc = CartBloc();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Bloc Stream Controller'),
      ),
      body: StreamBuilder<List<int>>(
          stream: bloc.state,
          builder: (context, snapshot) {
            print(snapshot.data?.first);
            return ListView.builder(
              itemBuilder: (context, index) =>
                  CartView(itemNumber: bloc.cartList[index]),
              itemCount: bloc.cartList.length,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
            );
          }),
    );
  }

  // @override
  // void initState() {
  //   bloc = CartBloc();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   bloc.dispode();
  //   super.dispose();
  // }
}

// class CartPage extends StatelessWidget {
//   static const String routeName = '/cart';
//   CartPage({Key? key}) : super(key: key);
//   late final CartBloc bloc;
//   @override
//   Widget build(BuildContext context) {
//     // bloc = bloc.state as CartBloc;
//   }
// }

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
        StreamBuilder<List<int>>(
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
    bloc = CartBloc();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispode();
    super.dispose();
  }
}
