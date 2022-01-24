import 'package:demo/cart/domain/cart_item.dart';
import 'package:demo/common/Extension.dart';
import 'package:demo/common/widgets/custom_box_decoration.dart';
import 'package:demo/common/widgets/custom_divider.dart';
import 'package:demo/ui-constraint/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/widgets/custom_checkbox.dart';
import '../../../common/widgets/custom_quantity_picker.dart';
import '../../strings.dart';
import 'custom_bottomsheet_item.dart';

class CartItemsCart extends StatefulWidget {
  final CartItem item;
  final void Function(int) onProductClicked;
  final ValueChanged<CartItem> onCheckBoxClicked;
  final ValueChanged<CartItem> onAddQuantityClicked;
  final ValueChanged<CartItem> onMinusQuantityClicked;
  final void Function(int) onRemoveClicked;
  final void Function(int) onRemoveAndAddFavoriteClicked;

  const CartItemsCart(
      {Key? key,
      required this.item,
      required this.onProductClicked,
      required this.onCheckBoxClicked,
      required this.onAddQuantityClicked,
      required this.onMinusQuantityClicked,
      required this.onRemoveClicked,
      required this.onRemoveAndAddFavoriteClicked})
      : super(key: key);

  @override
  _CartItemsCartState createState() => _CartItemsCartState();
}

class _CartItemsCartState extends State<CartItemsCart> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onProductClicked(widget.item.id);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.all(12.0),
        decoration: getBoxDecoration(borderColor: colorBorder),
        child: buildColumnBody(),
      ),
    );
  }

  Column buildColumnBody() {
    return Column(
      children: [
        buildProductTitleRow(),
        getDivider(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: buildRowMain(),
          ),
        ),
      ],
    );
  }

  Row buildRowMain() {
    return Row(
      children: [
        CustomCheckBox(
            item: widget.item, onCheckClicked: widget.onCheckBoxClicked),
        Expanded(
          child: Container(
            decoration: getBoxDecoration(color: Colors.blueAccent),
            width: 50,
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildRow1(),
                buildRow2(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Row buildRow1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.item.title,
          style: TextStyle(fontSize: 14, color: colorOnSurfaceVariant3),
        ),
        InkWell(
          onTap: () {
            getBottomSheet(context, widget.item);
            //widget.onRemoveItemClicked(widget.item);
          },
          child: SvgPicture.asset(
            "assets/icons/cart_trash.svg",
          ),
        )
      ],
    );
  }

  Row buildRow2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomQuantityPicker(
            cartItem: widget.item,
            onAddQuantityClicked: widget.onAddQuantityClicked,
            onMinusQuantityClicked: widget.onMinusQuantityClicked),
        Text(
          widget.item.salePrice.getPrice(),
          style: TextStyle(color: colorPrimary, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Row buildProductTitleRow() {
    return Row(
      children: [
        Text(
          getProductTitle(),
          style: TextStyle(color: colorOnSurfaceVariant2, fontSize: 14),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            color: colorOnSurfaceVariant1,
            size: 8,
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.item.campaign,
              style: TextStyle(color: colorGreen, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }

  getBottomSheet(BuildContext context, CartItem cartItem) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            buildBottomSheetTitleContainer(context, cartItem),
            buildFavoriteAndRemoveBasket(cartItem),
            buildRemoveBasket(cartItem),
            buildDivider(),
            buildCancel()
          ],
        );
      },
    );
  }

  InkWell buildCancel() {
    return InkWell(
      onTap: () {
        dismissBottomSheet();
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(cancelRemoveBasket),
        ),
      ),
    );
  }

  Padding buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: getDivider(),
    );
  }

  InkWell buildRemoveBasket(CartItem cartItem) {
    return InkWell(
      onTap: () {
        widget.onRemoveClicked(cartItem.id);
        dismissBottomSheet();
      },
      child: CustomBottomSheetItem(
          leading: SvgPicture.asset(
            "assets/icons/cart_trash.svg",
            color: colorOnSurfaceVariant2,
          ),
          title: removeBasket),
    );
  }

  InkWell buildFavoriteAndRemoveBasket(CartItem cartItem) {
    return InkWell(
      onTap: () {
        widget.onRemoveAndAddFavoriteClicked(cartItem.id);
        dismissBottomSheet();
      },
      child: CustomBottomSheetItem(
          leading: Icon(
            Icons.favorite,
            color: colorOnSurfaceVariant2,
          ),
          title: removeBasketAndAddFavorite),
    );
  }

  Container buildBottomSheetTitleContainer(
      BuildContext context, CartItem cartItem) {
    return Container(
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
    );
  }

  dismissBottomSheet() {
    Navigator.pop(context);
  }

  String getProductTitle() {
    return "Satıcı: ${widget.item.supplierName}";
  }
}
