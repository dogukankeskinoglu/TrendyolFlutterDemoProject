import 'package:demo/common/Extension.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: buildContainer(context),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: buildContainer(context),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: buildContainer(context),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: buildContainer(context),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: buildContainer(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      color: randomColorGenerator(),
    );
  }
}
