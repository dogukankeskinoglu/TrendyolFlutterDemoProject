import 'package:demo/ui-constraint/appColor.dart';
import 'package:flutter/material.dart';

class CustomBottomSheetItem extends StatelessWidget {
  final Widget leading;
  final String title;

  const CustomBottomSheetItem(
      {Key? key, required this.leading, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: leading,
          ),
        ),
        Expanded(
          flex: 9,
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: TextStyle(color: colorOnSurfaceVariant2),
            ),
          ),
        )
      ],
    );
  }
}
