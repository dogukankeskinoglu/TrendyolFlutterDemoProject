import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool isLeadingVisible;

  const CustomAppBar(
      {Key? key,
      required this.title,
      this.isLeadingVisible = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          title,
        ),
        leading: isLeadingVisible
            ? InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              )
            : null);
  }
}
