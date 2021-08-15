import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:delivery/common/pdf_view.dart';
import 'package:delivery/stores/checkout/cart_store.dart';
import 'package:delivery/stores/login/login_store.dart';
import 'package:delivery/stores/product/product_store.dart';
import 'package:delivery/views/checkout/cart_view.dart';
import 'package:delivery/views/home_view.dart';
import 'package:delivery/views/login_view.dart';
import 'package:delivery/views/products/products_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<LoginStore>(create: (_) => LoginStore()),
          Provider<ProductStore>(create: (_) => ProductStore()),
          Provider<CartStore>(create: (_) => CartStore())
        ],
        child: MaterialApp(
            title: 'Delivery',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/home':
                  return MaterialPageRoute(
                      builder: (_) => HomeView(), settings: settings);
                case '/products':
                  return MaterialPageRoute(builder: (_) => ProductsView());
                case '/cart':
                  return MaterialPageRoute(builder: (_) => CartView());
                case '/pdfViewer':
                  return MaterialPageRoute(
                      builder: (_) =>
                          PdfView((settings.arguments as PDFDocument)));
                case '/login':
                default:
                  return MaterialPageRoute(builder: (_) => LoginView());
              }
            }));
  }
}
