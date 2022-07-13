import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/riverpod/screens/cart.dart';
import 'package:state_managment/riverpod/screens/home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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
    );
  }
}
