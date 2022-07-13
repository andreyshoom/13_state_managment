import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/simple_state_managment/models/cart.dart';
import 'package:state_managment/simple_state_managment/screens/cart.dart';
import 'package:state_managment/simple_state_managment/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Cart>(
      create: (context) => Cart(),
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
