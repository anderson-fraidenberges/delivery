import 'package:delivery/stores/checkout/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TotalCart extends StatelessWidget {
  const TotalCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartStore = Provider.of<CartStore>(context);

    Future<void> CheckOutOnPress() async {
      final document = await cartStore.createReceiptPdf;
      Navigator.of(context)
          .pushReplacementNamed('/pdfViewer', arguments: document);
      await Future.delayed(const Duration(seconds: 2));
      cartStore.items.clear();
    }

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(4),
                width: MediaQuery.of(context).size.width * .95,
                color: Colors.blue.shade500,
                child: Center(
                    child: Text(
                  "Total",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Quantidade: ${cartStore.totalItemsCart}"),
                Text(
                    "Total: R\$ ${cartStore.totalValueCart.toStringAsFixed(2)}")
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/products");
                    },
                    child: Text('Continuar Comprando')),
                ElevatedButton(
                    onPressed: CheckOutOnPress, child: Text('Checkout')),
              ],
            )
          ],
        ),
      ),
    );
  }
}