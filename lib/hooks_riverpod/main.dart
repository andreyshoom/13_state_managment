import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_managment/hooks_riverpod/screens/cart.dart';
import 'package:state_managment/hooks_riverpod/screens/home.dart';

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
