import 'package:carousel_slider/carousel_slider.dart';
import 'package:delivery/common/custom_drawer/custom_drawer.dart';
import 'package:delivery/stores/product/product_store.dart';
import 'package:delivery/views/products/components/badge_home.dart';


import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productStore = Provider.of<ProductStore>(context);
    
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
                  BadgeHome()
                  ],),
      drawer: CustomDrawer(),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: const [
            Color.fromARGB(255, 54, 192, 255),
            Color.fromARGB(255, 153, 215, 168)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Center(
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(0.0),
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width * .80,
              child: Column(
                children: [
                   Text(
                    'Promoções',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.blue.shade700,
                      fontFamily: 'Billabong',
                      fontWeight: FontWeight.w500,
                    )),
                  Observer(
                    builder: (_) {
                      return CarouselSlider(
                          items: productStore.allProducts
                              .map((p) => Stack(
                                    children: [
                                      Image.asset(p.image, fit: BoxFit.cover),
                                      Center(
                                        child: ElevatedButton(
                                          
                                           style: ButtonStyle(
                                             padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                                             foregroundColor: MaterialStateProperty.all(Colors.green),
                                             backgroundColor: MaterialStateProperty.all(Colors.white),
                                             shape: MaterialStateProperty.all(CircleBorder()),),
                                            child: Icon(Icons.shopping_bag),
                                            
                                            onPressed: () {                                             
                                              Navigator.of(context)
                                                  .pushNamed("/products");
                                            }),
                                      )
                                    ],
                                  ))
                              .toList(),
                          options: CarouselOptions(
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 2),
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              enlargeStrategy:
                                  CenterPageEnlargeStrategy.height));
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
