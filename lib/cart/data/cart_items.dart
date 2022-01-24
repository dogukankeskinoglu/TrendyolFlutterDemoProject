import 'package:demo/cart/domain/OtherProductTitle.dart';
import 'package:demo/cart/domain/cart_item.dart';

import '../strings.dart';

var cartItems = [
  CartItem(1, "Trendyol", "Kargo Bedava", "Erkek Sweat", 1, 61, 61,
      isSelected: true),
  CartItem(2, "Black Sokak", "", "Erkek Tisört", 2, 80, 160),
  CartItem(3, "Trendyol", "Kargo Bedava", "Kol Saati", 1, 260, 260),
  CartItem(4, "Trendyol", "Hızlı Teslimat", "Futbol Topu", 1, 92, 92),
  CartItem(5, "Trendyol", "Kargo Bedava", "Erkek Sweat", 1, 61, 61),
  CartItem(6, "Black Sokak", "", "Erkek Tisört", 2, 70, 140),
];

var otherProducts = [
  CartItem(7, "Trendyol", "Kargo Bedava", "Erkek Sweat", 1, 61, 61,
      isSelected: true),
];

var favoriteProducts = [
  CartItem(8, "Trendyol", "Kargo Bedava", "Erkek kışlık mont", 1, 400, 400)
];

var tabTitles = [
  OtherProductTitle(expireProductTitle, true),
  OtherProductTitle(favoriteProductTitle, false)
];

var imageUrls = [
  "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.thespruce.com%2Ftips-to-make-clothes-last-longer-2146476&psig=AOvVaw2uKwNRkTQvDIUl025v00do&ust=1640646847570000&source=images&cd=vfe&ved=0CAgQjRxqFwoTCMDk6ffLgvUCFQAAAAAdAAAAABAD"
];
