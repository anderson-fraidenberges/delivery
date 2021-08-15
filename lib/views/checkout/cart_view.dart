import 'package:delivery/models/itemCart.dart';
import 'package:delivery/stores/checkout/cart_store.dart';
import 'package:delivery/views/checkout/components/cart_list_tile.dart';
import 'package:delivery/views/checkout/components/total_cart.dart';
import 'package:delivery/views/checkout/components/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartStore = Provider.of<CartStore>(context, listen: true);
    final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldkey,
        appBar: AppBar(title: const Text("Carrinho"), centerTitle: true),
        backgroundColor: Colors.blue.shade50,
        body: Observer(builder: (_) {
          if (cartStore.totalItemsCart == 0) return EmptyCart();
          cartStore.items.orderByName();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Expanded(
                flex: 3,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartStore.items.length,
                    itemBuilder: (context, index) {
                      return CartListTile(item: cartStore.items[index]);
                    }),
                // ListView(
                //     shrinkWrap: true,
                //     children: cartStore.items
                //         .map((item) => CartListTile(item: item))
                //         .toList()),
              ),
              Expanded(child: TotalCart())
            ],
          );
        }));
  }
}
