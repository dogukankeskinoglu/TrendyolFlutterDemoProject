import 'package:demo/cart/ui/cart_page.dart';
import 'package:demo/pdp/product_detail.dart';
import 'package:demo/ui-constraint/appColor.dart';
import 'package:demo/ui-constraint/textFont.dart';
import 'package:flutter/material.dart';

import 'common/error/error_page.dart';
import 'main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: colorOnPrimary,
          titleTextStyle: TextStyle(
            fontSize: appBarTextSize,
            color: colorOnSurfaceVariant3
          )
        ),
        scaffoldBackgroundColor: colorBackground,
      ),
      title: "Demo Project",
      routes: {
        '/': (context) => const MainPage(),
        "/cart": (context) => const CartPage(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const ErrorPage(),
      ),
    );
  }
}
