class CartItem {
  String name;
  double price;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 0,
  });
}
