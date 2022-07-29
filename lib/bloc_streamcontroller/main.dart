import 'package:flutter/material.dart';
import 'package:state_managment/bloc_streamcontroller/screens/cart.dart';
import 'package:state_managment/bloc_streamcontroller/screens/home.dart';
import 'package:state_managment/bloc_streamcontroller/models/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CartBloc bloc;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.state,
      builder: (context, snapshot) => MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomePage.routeName:
              return MaterialPageRoute(
                builder: (context) {
                  return HomePage(
                    bloc: bloc,
                  );
                },
              );
            case CartPage.routeName:
              return MaterialPageRoute(
                builder: (context) {
                  return CartPage(
                    bloc: bloc,
                  );
                },
              );
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    bloc = CartBloc();
  }

  @override
  void dispose() {
    bloc.dispode();
    super.dispose();
  }
}
