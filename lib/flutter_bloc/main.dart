import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/flutter_bloc/models/cart.dart';
import 'package:state_managment/flutter_bloc/screens/cart.dart';
import 'package:state_managment/flutter_bloc/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (context) => CartBloc(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomePage.routeName:
              return MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              );
            case CartPage.routeName:
              return MaterialPageRoute(
                builder: (context) {
                  return CartPage();
                },
              );
          }
        },
      ),
    );
  }
}
