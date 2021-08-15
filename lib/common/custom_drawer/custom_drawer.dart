import 'package:flutter/material.dart';

import 'custom_drawer_header.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Stack(children: <Widget>[
      Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
        const Color.fromARGB(255, 203, 236, 241),
        Colors.white
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
      ListView(children: <Widget>[
        CustomDrawerHeader(),
        DrawerTile(Icons.home, 'Início', '/home'),
        DrawerTile(Icons.list, 'Produtos', '/products'),
       
      ])
    ]));
  }
}