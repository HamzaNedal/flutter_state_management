import 'package:flutter/material.dart';
import 'package:flutter_state_management/InheritedWidget/shopping_cart/shoppingCartWidget.dart';
import 'package:flutter_state_management/InheritedWidget/shopping_cart/shoppingCart.dart';

class HomeShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShoppingCart(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ShoppingCartWidget(),
      ),
    );
  }
}
