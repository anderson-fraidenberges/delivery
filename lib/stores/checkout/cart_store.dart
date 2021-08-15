import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:delivery/helpers/pdf_creator.dart';
import 'package:delivery/models/itemCart.dart';
import 'package:delivery/models/product.dart';
import 'package:delivery/views/checkout/components/order_pdf.dart';
import 'package:mobx/mobx.dart';
part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  ObservableList<ItemCart> items = ObservableList<ItemCart>();

  @action
  void addToCart(Product product) {
    if (items.any((c) => c.id == product.id)) {
      var item = items.firstWhere((p) => p.id == product.id);
      item.quantity += 1;
      items.removeWhere((p) => p.id == product.id);
      items.add(item);
    } else {
      var item =
          ItemCart(product.id, product.name, product.image, product.price);
      items.add(item);
    }
    items.orderByName();
  }

  @action
  void removeCart(num id) => items.removeWhere((p) => p.id == id);

  @action
  void incrementItem(ItemCart item) {
    item.quantity++;
    items.removeWhere((p) => p.id == item.id);
    items.add(item);
    items.orderByName();
  }

  @action
  void decrementItem(ItemCart item) {
    if (item.quantity == 1) {
      removeCart(item.id);
      return;
    }
    item.quantity--;
    items.removeWhere((p) => p.id == item.id);
    items.add(item);
    items.orderByName();
  }

  @computed
  int get totalItemsCart => items.fold(
      0, (previousValue, element) => previousValue + (element.quantity));

  @computed
  num get totalValueCart => items.fold(
      0,
      (previousValue, element) =>
          previousValue + (element.quantity * element.price));

     

  @computed
  Future<PDFDocument> get createReceiptPdf async {
    var bodyDocument = OrderPdf.CreateBody(items, totalValueCart);
    PDFDocument document = await PdfCreator.create(bodyDocument, "order.pdf");
    return document;
  }
}
