import 'package:delivery/stores/login/login_store.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginStore loginStore;
  late ReactionDisposer disposer;

  @override
  void didChangeDependencies() {   
    loginStore = Provider.of<LoginStore>(context);
    super.didChangeDependencies();
      disposer = when((_) => loginStore.isLoggedIn, () {
      Navigator.of(context).pushNamed("/home");
    });
  
  }

  @override
  Widget build(BuildContext context) {
      final _primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          appBar: AppBar(           
            centerTitle: true,
            automaticallyImplyLeading:false
          ),
          body: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(24),
            child: Column(
            
              children: [
               Text(
                    'Delivery',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontFamily: 'Billabong',
                      fontWeight: FontWeight.w500,
                    )),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 24,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Observer(
                          builder: (_) {
                            return Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: TextField(
                                onChanged: loginStore.setEmail,
                                decoration: InputDecoration(
                                  hintText: "e-mail",
                                  border: InputBorder.none,
                                  prefixIcon:
                                      const Icon(Icons.account_circle),
                                ),
                                textAlignVertical: TextAlignVertical.center,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        Observer(builder: (_) {
                          return Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: TextField(
                              obscureText: loginStore.obscurePassword,
                              onChanged: loginStore.setPassword,
                              decoration: InputDecoration(
                                hintText: "senha",
                                border: InputBorder.none,
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: GestureDetector(
                                    child: loginStore.obscurePassword
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off),
                                    onTap: loginStore.togglePasswordVisible),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                            ),
                          );
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        Observer(
                          builder: (_) {
                            return
                                // ignore: deprecated_member_use
                                RaisedButton(
                                    child: loginStore.isLoading
                                        ? CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.white),
                                          )
                                        : Text('Entrar',
                                            style: TextStyle(fontSize: 18)),
                                    color: _primaryColor,
                                    disabledColor: _primaryColor.withOpacity(0.3),
                                    textColor: Colors.white,
                                    onPressed: () async {
                                      await loginStore
                                          .doLogin()
                                          .catchError((onError) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                                content: Text(onError.toString())));
                                      });
                                    });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    disposer();

    super.dispose();
  }
}
