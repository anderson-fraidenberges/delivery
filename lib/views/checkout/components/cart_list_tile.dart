import 'package:delivery/models/itemCart.dart';
import 'package:delivery/stores/checkout/cart_store.dart';
import 'package:delivery/views/checkout/components/item_tile_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartListTile extends StatelessWidget {
  const CartListTile({Key? key, required this.item}) : super(key: key);

  final ItemCart item;

  @override
  Widget build(BuildContext context) {
    final cartStore = Provider.of<CartStore>(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Container(
          height: 100,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.asset(this.item.image))),
              const SizedBox(width: 10),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800)),
                    Text('R\$ ${item.price.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w800))
                  ]),
              Expanded(child: Container()),
              Column(
                children: [Expanded(child: ItemTileButton(itemCart: item))],
              ),
              Expanded(child: Container()),
              ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    foregroundColor: MaterialStateProperty.all(Colors.red),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(CircleBorder()),
                  ),
                  child: Icon(Icons.remove_shopping_cart),
                  onPressed: () {
                    cartStore.removeCart(item.id);
                  }),
            ],
          )),
    );
  }
}
