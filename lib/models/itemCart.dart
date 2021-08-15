

class ItemCart {
  ItemCart(this.id, this.name, this.image, this.price, {this.quantity = 1});
  
  int id;
  String name;  
  String image;
  num price;
  int quantity;
}

extension ItemCartExtension on List<ItemCart> {
  void orderByName() {
    this.sort((a, b) => a.name.toUpperCase().compareTo(b.name.toUpperCase()));
  }
}