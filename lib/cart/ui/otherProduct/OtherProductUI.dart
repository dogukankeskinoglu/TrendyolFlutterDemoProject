import 'package:demo/cart/domain/cart_item.dart';
import 'package:demo/common/widgets/custom_button.dart';
import 'package:demo/common/Extension.dart';
import 'package:demo/common/widgets/custom_box_decoration.dart';
import 'package:demo/ui-constraint/appColor.dart';
import 'package:flutter/material.dart';

import '../../strings.dart';

class OtherProductUI extends StatelessWidget {
  final CartItem item;
  final void Function(int) onProductClicked;
  final void Function(int) onAddToBasketClicked;

  const OtherProductUI(
      {Key? key,
      required this.item,
      required this.onProductClicked,
      required this.onAddToBasketClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onProductClicked(item.id);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 50,
              height: 50,
              decoration: getBoxDecoration(
                color: Colors.cyan,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.supplierName,
                      style: TextStyle(
                          color: colorOnSurfaceVariant3,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      item.title,
                      style: TextStyle(
                          color: colorOnSurfaceVariant2,
                          fontWeight: FontWeight.normal,
                          fontSize: 15),
                    ),
                    Text(
                      item.price.getPrice(),
                      style: TextStyle(
                          color: colorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 3,
            child: CustomButton(
              onPressed: () {
                onAddToBasketClicked(item.id);
              },
              text: addToBasket,
              borderColor: colorPrimary,
              backGroundColor: colorOnPrimary,
              textColor: colorPrimary,
            ),
          )
        ],
      ),
    );
  }
}
