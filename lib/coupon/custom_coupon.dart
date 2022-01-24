import 'package:demo/common/Extension.dart';
import 'package:demo/common/widgets/custom_box_decoration.dart';
import 'package:demo/coupon/strings.dart';
import 'package:demo/ui-constraint/appColor.dart';
import 'package:flutter/material.dart';

import 'domain/Coupon.dart';

class CustomCoupon extends StatefulWidget {
  final Coupon coupon;

  const CustomCoupon({Key? key, required this.coupon}) : super(key: key);

  @override
  _CustomCouponState createState() => _CustomCouponState();
}

class _CustomCouponState extends State<CustomCoupon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.coupon.title,
          style: TextStyle(
              color: colorOnSurfaceVariant3,
              fontWeight: FontWeight.bold,
              fontSize: 10.0),
        ),
        Text(
          getCouponLowerLimitText(widget.coupon.lowerLimit),
          style: TextStyle(
              color: colorOnSurfaceVariant2,
              fontWeight: FontWeight.normal,
              fontSize: 10.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.coupon.discount.getPrice(),
              style: TextStyle(
                  color: colorOnSurfaceVariant3,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: getAppliedBoxDecoration(widget.coupon.isApplied),
              child: Text(
                getAppliedText(widget.coupon.isApplied),
                style: TextStyle(
                    color: getAppliedTextColor(widget.coupon.isApplied),
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      ],
    );
  }
}

String getCouponLowerLimitText(String title) {
  return "Alt limit $title TL";
}

Color getAppliedTextColor(bool isApplied) {
  return isApplied ? colorOnPrimary : colorPrimary;
}

String getAppliedText(bool isApplied) {
  return isApplied ? coupon_is_apply : coupon_is_not_apply;
}

BoxDecoration getAppliedBoxDecoration(bool isApplied) {
  return isApplied
      ? getBoxDecoration(color: colorPrimary, borderColor: colorPrimary)
      : getBoxDecoration(color: colorOnPrimary, borderColor: colorPrimary);
}
