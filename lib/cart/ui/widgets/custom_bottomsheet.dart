import 'package:demo/cart/domain/cart_item.dart';
import 'package:demo/common/widgets/custom_divider.dart';
import 'package:demo/ui-constraint/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../strings.dart';
import 'custom_bottomsheet_item.dart';

getBottomSheet(
    BuildContext context,
    CartItem cartItem,
    Function(int) onRemoveClicked,
    Function(int) onRemoveAndAddFavoriteClicked) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Wrap(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: colorBackground,
            width: MediaQuery.of(context).size.width,
            child: RichText(
              text: TextSpan(
                text: cartItem.supplierName,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: colorOnSurfaceVariant2),
                children: <TextSpan>[
                  TextSpan(
                      text: " ${cartItem.title}",
                      style: TextStyle(color: colorOnSurfaceVariant1)),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: onRemoveAndAddFavoriteClicked(cartItem.id),
            child: CustomBottomSheetItem(
                leading: Icon(
                  Icons.favorite,
                  color: colorOnSurfaceVariant2,
                ),
                title: removeBasketAndAddFavorite),
          ),
          InkWell(
            onTap: onRemoveClicked(cartItem.id),
            child: CustomBottomSheetItem(
                leading: SvgPicture.asset(
                  "assets/icons/cart_trash.svg",
                  color: colorOnSurfaceVariant2,
                ),
                title: removeBasket),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: getDivider(),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(cancelRemoveBasket),
              ))
        ],
      );
    },
  );
}
