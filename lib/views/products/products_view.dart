import 'package:badges/badges.dart';
import 'package:delivery/common/custom_drawer/custom_drawer.dart';
import 'package:delivery/stores/checkout/cart_store.dart';
import 'package:delivery/stores/product/product_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'components/procuct_list_tile.dart';
import 'components/search_dialog.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productStore = Provider.of<ProductStore>(context);
    final cartStore = Provider.of<CartStore>(context);
    final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: CustomDrawer(),
      key: scaffoldkey,
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
          title: LayoutBuilder(builder: (_, constraints) {
            constraints.biggest.width;
            return GestureDetector(
                onTap: () async {
                  final search = await showDialog<String>(
                      context: context,
                      builder: (_) =>
                          SearchDialog(initialText: productStore.search));

                  if (search != null) {
                    productStore.search = search;
                  }
                },
                child: Container(
                    width: constraints.biggest.width,
                    child: Text(productStore.search,
                        textAlign: TextAlign.center)));
          }),
          centerTitle: true,
          actions: <Widget>[
            Observer(builder: (_) {
              if (productStore.search.isEmpty) {
                return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) =>
                              SearchDialog(initialText: productStore.search));

                      if (search != null) {
                        productStore.search = search;
                      }
                    });
              } else {
                return IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () async {
                      productStore.search = '';
                    });
              }
            }),
          ]),
      body: Observer(builder: (_) {
        final filteredProducts = productStore.filteredProducts;
        return Padding(
          padding: const EdgeInsets.only(top:20),
          child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (_, index) {
                return ProductListTile(product: filteredProducts[index]);
              }),
        );
      }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Theme.of(context).primaryColor,
          child: Observer(builder: (_) { return Badge(
            badgeColor: Colors.blue,
            toAnimate: true,        
            animationType: BadgeAnimationType.fade,
            showBadge: cartStore.totalItemsCart > 0,
            badgeContent:
               Text(cartStore.totalItemsCart.toString(),
                  style: TextStyle(color: Colors.white)),
           
            child: Icon(Icons.shopping_cart)); }),
          
          onPressed: () async {
            Navigator.of(context).pushNamed("/cart");
          }),
    );
  }
}
