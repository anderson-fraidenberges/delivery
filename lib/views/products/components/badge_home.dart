import 'package:badges/badges.dart';
import 'package:delivery/stores/checkout/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class BadgeHome extends StatelessWidget {
  const BadgeHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final cartStore = Provider.of<CartStore>(context);
    return   Badge(
                      badgeContent:Observer(builder: (_){
                        return  Text(cartStore.totalItemsCart.toString(), style: TextStyle(color: Colors.white));
                      }),
                      position: BadgePosition.topStart(top: 1),
                      badgeColor: Colors.blue,
                      alignment: Alignment.topLeft,                      
                      shape: BadgeShape.circle,
                      child: IconButton(
                          icon: Icon(Icons.shopping_cart),
                          color: Colors.white,
                          onPressed: () =>
                              Navigator.of(context).pushNamed("/cart")),
                    );
  }
}