import 'package:delivery/stores/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginStore = Provider.of<LoginStore>(context);

    return Container(
        padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),
        height: 180,
        child: Observer(builder: (_) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Delivery',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    )),
                Text('Olá, ${loginStore.email}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                GestureDetector(
                    onTap: () {
                      if (loginStore.isLoggedIn) loginStore.logout();

                      Navigator.of(context).pushNamed('/login');
                    },
                    child: Text("Sair",
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold)))
              ]);
        }));
  }
}
