class CartItem {
  final int id;
  final String supplierName;
  final String campaign;
  final String title;
  int quantity;
  final double price;
  double salePrice;
  bool isSelected;

  CartItem(this.id, this.supplierName, this.campaign, this.title, this.quantity,
      this.price, this.salePrice,
      {this.isSelected = false});

  @override
  String toString() {
    return "SupplierName:$supplierName CargoTitle:$campaign ProductTitle:$title ProductQuantity:$quantity ProductPrice:$price";
  }
}
