import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,        
        children: <Widget>[
          Icon(
            Icons.remove_shopping_cart,
            size: 80.0,
            color: Colors.blue.shade700,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            "Nenhum produto no carrinho",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade700,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
