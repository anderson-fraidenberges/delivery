import 'package:delivery/models/itemCart.dart';
import 'package:flutter/material.dart';

class CheckoutListTile extends StatelessWidget {
  CheckoutListTile({required this.itemCart});
  final ItemCart itemCart;

  @override
  Widget build(BuildContext context) {
    final total = (itemCart.quantity * itemCart.price);
    return ListTile(
      isThreeLine: false,
      dense: true,
      title:
          Text("${itemCart.id.toString().padLeft(4, "0")} - ${itemCart.name}"),
      subtitle: Align(
          alignment: Alignment.centerRight,
          child: Text(
              "${itemCart.quantity} x ${itemCart.price.toStringAsFixed(2)} = ${total.toStringAsFixed(2)}")),
    );
  }
}
