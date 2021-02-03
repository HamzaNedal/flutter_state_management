import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_state_management/InheritedWidget/shopping_cart/cart.dart';
import 'package:flutter_state_management/InheritedWidget/shopping_cart/product.dart';
import 'package:badges/badges.dart';
import 'package:flutter_state_management/InheritedWidget/shopping_cart/shoppingCart.dart';

class ShoppingCartWidget extends StatelessWidget {
  List<Product> items = List.generate(100, (index) {
    return Product(
        name: "Product $index", price: Random().nextInt(5000), isCheck: false);
  });
  @override
  Widget build(BuildContext context) {
    ShoppingCart cart = ShoppingCart.of(context);
    return StatefulBuilder(builder: (context, StateSetter setState) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Shopping Cart"),
          actions: <Widget>[
            Container(
              child: Badge(
                position: BadgePosition.topEnd(top: 5, end: 6),
                badgeContent: Text(
                  "${cart.products.length}",
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart()));
                    // Navigator.pushNamed(context, '/cart');
                  },
                ),
              ),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Expanded(child: Text(items[i].name)),
                      Checkbox(
                        value: items[i].isCheck,
                        onChanged: (value) {
                          setState(() {
                            items[i].isCheck = !items[i].isCheck;
                            if (items[i].isCheck) {
                              cart.products.add(items[i]);
                            } else {
                              cart.products.remove(items[i]);
                            }
                          });
                        },
                      )
                    ],
                  ),
                  subtitle: Text('${items[i].price}\$'),
                ),
              );
            }),
      );
    });
  }
}
