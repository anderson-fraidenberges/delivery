import 'package:delivery/models/product.dart';
import 'package:delivery/stores/checkout/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({Key? key, required this.product}) : super(key: key);

  final Product product;

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
                  aspectRatio: 1, child: Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Image.asset(this.product.image),
                  )),
              const SizedBox(width: 10),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(product.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800)),
                            Text(
                                'R\$ ${product.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800)),
                                    
                  
                  ]),
                  Expanded(child: Container()),
           Expanded(
             child: Align(alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(10)),
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.green),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all(
                                        CircleBorder()),
                                  ),
                                  child: Icon(Icons.add_shopping_cart),
                                  onPressed: () {
                                    cartStore.addToCart(product);
                                  }),
                            ),
           ), ],
          )),
    );
  }
}
