import 'package:flutter/material.dart';

BoxDecoration getBoxDecoration(
    {double radius = 4.0, Color borderColor = Colors.grey, Color color = Colors.white}) {
  return BoxDecoration(
    color: color,
    border: Border.all(color: borderColor),
    borderRadius: BorderRadius.all(
      Radius.circular(radius),
    ),
  );
}
