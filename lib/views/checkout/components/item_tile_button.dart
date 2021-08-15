import 'package:delivery/models/itemCart.dart';
import 'package:delivery/stores/checkout/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ItemTileButton extends StatelessWidget {
  const ItemTileButton({Key? key, required this.itemCart}) : super(key: key);
  final ItemCart itemCart;

  @override
  Widget build(BuildContext context) {
    final cartStore = Provider.of<CartStore>(context);

    return Observer(builder: (_) {
      return Row(
        children: [
          ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(1)),
                foregroundColor: MaterialStateProperty.all(Colors.red),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(CircleBorder()),
              ),
              child: Icon(Icons.remove),
              onPressed: () {
                cartStore.decrementItem(itemCart);
              }),
          Text(itemCart.quantity.toString()),
          ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(1)),
                foregroundColor: MaterialStateProperty.all(Colors.blue),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(CircleBorder()),
              ),
              child: Icon(Icons.add),
              onPressed: () {
                cartStore.incrementItem(itemCart);
              }),
        ],
      );
    });
  }
}
