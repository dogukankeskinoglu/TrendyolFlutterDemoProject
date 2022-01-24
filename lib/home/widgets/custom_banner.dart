import 'package:demo/common/widgets/custom_box_decoration.dart';
import 'package:demo/home/domain/Banner.dart';
import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  final HomeBanner homeBanner;

  const CustomBanner({Key? key, required this.homeBanner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getBoxDecoration(
        color: homeBanner.color
      ),
      height: MediaQuery.of(context).size.height / 5,
      child: Center(
        child: Text(
          homeBanner.category,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
