import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unknown Page"),
      ),
      body: const Center(
        child: Text("Yanlış adres kardeşim"),
      ),
    );
  }
}
