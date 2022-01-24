import 'package:demo/cart/domain/cart_item.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final CartItem item;
  final ValueChanged<CartItem> onCheckClicked;

  const CustomCheckBox(
      {Key? key, required this.item, required this.onCheckClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: item.isSelected,
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.all<Color>(Colors.orange),
        side: const BorderSide(
          color: Colors.black38,
          width: 2.0,
        ),
        onChanged: (boolean) {
          onCheckClicked(item);
        });
  }
}
