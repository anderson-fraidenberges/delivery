import 'package:delivery/models/product.dart';
import 'package:mobx/mobx.dart';
part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  _ProductStore() {
    _loadProducts();
  }

  @observable
  String search = "";

  @observable
  List<Product> allProducts = [];

  @action
  void setSearch(String value) => search = value;

  List<Product> get filteredProducts {
    final List<Product> filteredProducts = [];
    if (search.isEmpty) {
      filteredProducts.addAll(allProducts);
    } else {
      filteredProducts.addAll(allProducts
          .where((w) => w.name.toLowerCase().contains(search.toLowerCase())));
    }

    return filteredProducts;
  }  

  void _loadProducts() {
    allProducts.addAll([
      Product(1, "Maçã", "assets/images/maca.jpeg", 9.68),
      Product(2, "Abacaxi", "assets/images/abacaxi.jpeg", 4.99),
      Product(3, "Manga", "assets/images/manga.jpeg", 2.99),
      Product(4, "Banana", "assets/images/banana.jpeg", 6.99),
      Product(5, "Pera", "assets/images/pera.jpeg", 12.99)
    ]);
  }
}
