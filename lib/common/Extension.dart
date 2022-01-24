import 'dart:math';

import 'dart:ui';

Color randomColorGenerator() {
  Random random = Random();
  return Color((random.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}

extension StringExtension on String {
  String getPrice() => "$this TL";
}

extension IntExtension on double {
  String getPrice() => "$this TL";
}

extension NullableStringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

_randomQuantity() {
  Random random = Random();
  return random.nextInt(10);
}

_randomPrice() {
  Random random = Random();
  return random.nextInt(60).toDouble();
}

_randomCampaign() {
  var campaigns = ["Kargo Bedava", "Hızlı Teslimat", ""];
  campaigns.shuffle();
  return campaigns.first;
}

_randomSupplierName() {
  var suppliers = ["Trendyol", "X Mağaza", "Y Mağaza"];
  suppliers.shuffle();
  return suppliers.first;
}

_randomTitle() {
  var titles = ["Tisört", "SweatShirt", "Saat", "Eldiven", "Kazak"];
  titles.shuffle();
  return titles.first;
}