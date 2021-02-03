import 'package:flutter/material.dart';
import 'package:flutter_state_management/InheritedWidget/shopping_cart/shoppingCart.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = ShoppingCart.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: cart.products.length,
          itemBuilder: (context, i) {
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Expanded(child: Text(cart.products[i].name)),
                  ],
                ),
                subtitle: Text('${cart.products[i].price}\$'),
              ),
            );
          }),
    );
  }
}
