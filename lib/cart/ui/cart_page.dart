import 'package:demo/cart/data/cart_items.dart';
import 'package:demo/cart/domain/cart_item.dart';
import 'package:demo/cart/strings.dart';
import 'package:demo/cart/ui/cart/CartViewModel.dart';
import 'package:demo/cart/ui/otherProduct/OtherProductUI.dart';
import 'package:demo/common/widgets/custom_appBar.dart';
import 'package:demo/common/widgets/custom_button.dart';
import 'package:demo/cart/ui/widgets/custom_card.dart';
import 'package:demo/common/widgets/custom_divider.dart';
import 'package:demo/pdp/product_detail.dart';
import 'package:demo/ui-constraint/SnackBarDuration.dart';
import 'package:demo/ui-constraint/appColor.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var index = cartItems.length;
  var cartViewModel = CartViewModel();
  var currentIndicator = 0.0;
  var currentItemList = otherProducts;
  var currentSelectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(title: "Sepetim - ${cartItems.length} ürün"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(child: buildCartListView()),
                      Flexible(child: buildOtherProductContainer()),
                    ],
                  ),
                ),
              ),
            ),
            buildApproveCartView()
          ],
        ));
  }

  Container buildApproveCartView() {
    return Container(
      decoration: BoxDecoration(
        color: colorOnPrimary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Toplam"),
                Text(
                  "31.12 TL",
                  style: TextStyle(
                      color: colorPrimary, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: colorPrimary,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 64)),
              onPressed: () {},
              child: Text(
                "Sepeti Onayla",
                style: TextStyle(color: colorOnPrimary),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildOtherProductContainer() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: colorOnPrimary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Visibility(
                child: buildOtherProductTitle(),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: buildOtherProductListView(),
              ),
            )
          ],
        ),
      ),
    );
  }

  ListView buildOtherProductListView() {
    var list = cartViewModel.getOtherProductItems(currentSelectedTab);
    return ListView.separated(
        itemBuilder: (context, index) => OtherProductUI(
              item: list[index],
              onAddToBasketClicked: (itemId) {
                setState(() {
                  cartViewModel.addToCart(itemId, list);
                });
              },
              onProductClicked: (itemId) {
                navigateProductDetail(context, itemId);
              },
            ),
        separatorBuilder: (context, index) {
          return getDivider();
        },
        itemCount: list.length);
  }

  ListView buildOtherProductTitle() {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      itemCount: tabTitles.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        var item = tabTitles[index];
        return Visibility(
            visible: cartViewModel.getOtherProductItems(index).isNotEmpty,
            child: CustomButton(
              borderRadius: 4.0,
              textColor:
                  item.isSelected ? colorPrimary : colorOnSurfaceVariant2,
              borderColor: item.isSelected ? colorPrimary : colorBorder,
              backGroundColor: colorOnPrimary,
              onPressed: () {
                setState(() {
                  currentSelectedTab = index;
                  cartViewModel.updateTitle(index);
                });
              },
              text:
                  "${item.text} (${cartViewModel.getOtherProductItems(index).length})",
            ));
      },
    );
  }

  ListView buildCartListView() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return getDivider();
      },
      itemCount: cartItems.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => CartItemsCart(
        item: cartItems[index],
        onProductClicked: (itemId) {
          setState(() {
            navigateProductDetail(context, itemId);
          });
        },
        onCheckBoxClicked: (cartItem) {
          setState(() {
            cartViewModel.updateStatus(cartItem);
          });
        },
        onAddQuantityClicked: (cartItem) {
          setState(() {
            cartViewModel.addQuantity(cartItem);
          });
        },
        onMinusQuantityClicked: (cartItem) {
          setState(() {
            cartViewModel.minusQuantity(cartItem);
          });
        },
        onRemoveClicked: (itemId) {
          setState(() {
            cartViewModel.removeFromCart(itemId);
          });
        },
        onRemoveAndAddFavoriteClicked: (itemId) {
          setState(() {
            cartViewModel.removeFromCartAndAddFavorite(itemId);
          });
        },
      ),
    );
  }

  navigateProductDetail(BuildContext context, int itemId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetail(
          itemId: itemId,
        ),
      ),
    );
  }

  showSnackBar(String message) {
    var snackBar = SnackBar(
      content: Text(message),
      duration: SnackBarDuration.short.duration,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
