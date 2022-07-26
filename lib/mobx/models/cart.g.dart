// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartState on _CartState, Store {
  late final _$cartListAtom =
      Atom(name: '_CartState.cartList', context: context);

  @override
  List<int> get cartList {
    _$cartListAtom.reportRead();
    return super.cartList;
  }

  @override
  set cartList(List<int> value) {
    _$cartListAtom.reportWrite(value, super.cartList, () {
      super.cartList = value;
    });
  }

  late final _$_CartStateActionController =
      ActionController(name: '_CartState', context: context);

  @override
  void addItem(int item) {
    final _$actionInfo =
        _$_CartStateActionController.startAction(name: '_CartState.addItem');
    try {
      return super.addItem(item);
    } finally {
      _$_CartStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(int item) {
    final _$actionInfo =
        _$_CartStateActionController.startAction(name: '_CartState.removeItem');
    try {
      return super.removeItem(item);
    } finally {
      _$_CartStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cartList: ${cartList}
    ''';
  }
}
