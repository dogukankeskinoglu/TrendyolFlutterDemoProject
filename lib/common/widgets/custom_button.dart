import 'package:demo/ui-constraint/appColor.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? height;
  final Color? textColor;
  final Color? backGroundColor;
  final double? borderRadius;
  final Color? borderColor;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.height = 30.0,
    this.textColor,
    this.backGroundColor,
    this.borderRadius,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(backGroundColor ?? colorPrimary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              side: BorderSide(color: borderColor ?? colorPrimary),
            ),
          ),
        ),
      ),
    );
  }
}
