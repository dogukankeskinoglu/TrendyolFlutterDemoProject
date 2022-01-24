import 'package:demo/cart/domain/cart_item.dart';
import 'package:demo/common/widgets/custom_box_decoration.dart';
import 'package:demo/ui-constraint/appColor.dart';
import 'package:flutter/material.dart';

class CustomQuantityPicker extends StatefulWidget {
  final CartItem cartItem;
  final ValueChanged<CartItem> onAddQuantityClicked;
  final ValueChanged<CartItem> onMinusQuantityClicked;

  const CustomQuantityPicker(
      {Key? key,
      required this.cartItem,
      required this.onAddQuantityClicked,
      required this.onMinusQuantityClicked})
      : super(key: key);

  @override
  _CustomQuantityPickerState createState() => _CustomQuantityPickerState();
}

class _CustomQuantityPickerState extends State<CustomQuantityPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getBoxDecoration(radius: 16, borderColor: colorBorder),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            child: Icon(Icons.remove, color: colorPrimary),
            onTap: () {
              widget.onMinusQuantityClicked(widget.cartItem);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
            child: CircleAvatar(
              child: Text(
                widget.cartItem.quantity.toString(),
                style: TextStyle(color: colorPrimary),
              ),
              maxRadius: 12,
              backgroundColor: colorPrimaryVariant,
            ),
          ),
          InkWell(
            child: Icon(Icons.add, color: colorPrimary),
            onTap: () {
              widget.onAddQuantityClicked(widget.cartItem);
            },
          ),
        ],
      ),
    );
  }
}
