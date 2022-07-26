import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_managment/redux/screens/cart.dart';
import 'package:state_managment/redux/screens/home.dart';
import 'package:state_managment/redux/models/cart.dart';

void main() {
  runApp(StoreProvider(
    store: store,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
