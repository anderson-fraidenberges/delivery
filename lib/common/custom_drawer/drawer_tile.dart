import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  DrawerTile(this.iconData, this.title, this.route);
  //DrawerTile({ Key? key, this.iconData, this.title }) : super(key: key);
  final IconData? iconData;
  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {    
    
    final primaryColor = Theme.of(context).primaryColor;
    return InkWell(
        onTap: () {
          

          Navigator.of(context).pushNamed(route);
    

        },
        child: SizedBox(
            height: 60,
            child: Row(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Icon(iconData, size: 32, 
                  color: primaryColor)),
              Text(title,
                  style: TextStyle(fontSize: 16, 
                  color: primaryColor)),
            ])));
  }
}