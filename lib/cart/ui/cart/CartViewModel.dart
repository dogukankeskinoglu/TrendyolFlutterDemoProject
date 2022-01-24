import 'package:demo/cart/data/cart_items.dart';
import 'package:demo/cart/domain/cart_item.dart';

class CartViewModel {
  updateStatus(CartItem cartItem) {
    var index = cartItems.indexWhere((element) => element.id == cartItem.id);
    cartItems[index].isSelected = !(cartItems[index].isSelected);
  }

  addQuantity(CartItem cartItem) {
    var index = cartItems.indexWhere((element) => element.id == cartItem.id);
    cartItems[index].quantity += 1;
    cartItems[index].salePrice =
        cartItems[index].price * cartItems[index].quantity;
  }

  minusQuantity(CartItem cartItem) {
    var index = cartItems.indexWhere((element) => element.id == cartItem.id);
    cartItems[index].quantity -= 1;
    cartItems[index].salePrice =
        cartItems[index].price * cartItems[index].quantity;
  }

  addToCart(int itemId,List<CartItem> otherProducts) {
      var index = otherProducts.indexWhere((element) => element.id == itemId);
      var item = otherProducts[index];
      cartItems.insert(0, item);
      otherProducts.removeAt(index);
  }

  removeFromCart(int itemId) {
      var index = cartItems.indexWhere((element) => element.id == itemId);
      var item = cartItems[index];
      cartItems.removeAt(index);
      otherProducts.insert(0, item);
  }

  removeFromCartAndAddFavorite(int itemId) {
    var index = cartItems.indexWhere((element) => element.id == itemId);
    var item = cartItems[index];
    cartItems.removeAt(index);
    favoriteProducts.insert(0, item);
  }

  isVisibleOtherProduct() {
    return otherProducts.isNotEmpty;
  }

  isVisibleCartProducts() {
    return cartItems.isNotEmpty;
  }

  updateTitle(int index) {
    if (index == 0 && otherProducts.isNotEmpty) {
      tabTitles[index].isSelected = true;
      tabTitles[1].isSelected = false;
    }
    else if(index == 1 && favoriteProducts.isNotEmpty) {
      tabTitles[0].isSelected = false;
      tabTitles[index].isSelected = true;
    }
  }

  List<CartItem> getOtherProductItems(int index) {
    return index == 0 ? otherProducts : favoriteProducts;
  }
}
