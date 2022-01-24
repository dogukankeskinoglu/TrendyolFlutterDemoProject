import 'package:demo/home/data/banners.dart';
import 'package:demo/home/widgets/custom_banner.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 2,
          children: homeBannerItems.map((value) {
            return CustomBanner(
              homeBanner: value,
            );
          }).toList(),
        ),
      ),
    );
  }
}
