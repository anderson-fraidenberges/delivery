// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStore, Store {
  Computed<int>? _$totalItemsCartComputed;

  @override
  int get totalItemsCart =>
      (_$totalItemsCartComputed ??= Computed<int>(() => super.totalItemsCart,
              name: '_CartStore.totalItemsCart'))
          .value;
  Computed<num>? _$totalValueCartComputed;

  @override
  num get totalValueCart =>
      (_$totalValueCartComputed ??= Computed<num>(() => super.totalValueCart,
              name: '_CartStore.totalValueCart'))
          .value;
  Computed<Future<PDFDocument>>? _$createReceiptPdfComputed;

  @override
  Future<PDFDocument> get createReceiptPdf => (_$createReceiptPdfComputed ??=
          Computed<Future<PDFDocument>>(() => super.createReceiptPdf,
              name: '_CartStore.createReceiptPdf'))
      .value;

  final _$itemsAtom = Atom(name: '_CartStore.items');

  @override
  ObservableList<ItemCart> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<ItemCart> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$_CartStoreActionController = ActionController(name: '_CartStore');

  @override
  void addToCart(Product product) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.addToCart');
    try {
      return super.addToCart(product);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCart(num id) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.removeCart');
    try {
      return super.removeCart(id);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementItem(ItemCart item) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.incrementItem');
    try {
      return super.incrementItem(item);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementItem(ItemCart item) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.decrementItem');
    try {
      return super.decrementItem(item);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
totalItemsCart: ${totalItemsCart},
totalValueCart: ${totalValueCart},
createReceiptPdf: ${createReceiptPdf}
    ''';
  }
}
