import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorilerim"),
      ),
      body: const Center(
        child: Text("sa"),
      ),
    );
  }
}

//b            Padding(padding: EdgeInsets.symmetric(vertical: 10), child :Container(height: 60, color: Colors.black,))
