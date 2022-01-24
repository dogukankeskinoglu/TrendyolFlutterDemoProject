import 'package:demo/common/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final int itemId;

  const ProductDetail({Key? key, required this.itemId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: "Product Detail",
          isLeadingVisible: true,
        ),
      ),
      body: Center(
        child: Text(itemId.toString()),
      ),
    );
  }
  
  popLastPage(BuildContext context){
    Navigator.of(context).pop();
  }
}
