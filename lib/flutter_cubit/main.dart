import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/flutter_cubit/models/cart.dart';
import 'package:state_managment/flutter_cubit/screens/cart.dart';
import 'package:state_managment/flutter_cubit/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) => CartCubit([]),
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomePage.routeName:
              return MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              );
            case CartPage.routeName:
              return MaterialPageRoute(
                builder: (context) {
                  return const CartPage();
                },
              );
          }
        },
      ),
    );
  }
}
