import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  final String title;

  const AppBarText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          const TextStyle(fontSize: 20.0, color: Color.fromRGBO(20, 20, 20, 1)),
    );
  }
}
