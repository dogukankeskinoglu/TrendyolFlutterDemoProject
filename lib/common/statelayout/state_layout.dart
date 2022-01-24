import 'package:demo/common/widgets/custom_appBar.dart';
import 'package:demo/common/statelayout/state_manager.dart';
import 'package:flutter/material.dart';

class StateLayout extends StatelessWidget {
  final StateManager state;

  const StateLayout(StateManager stateManager, {Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar() as AppBar,
      body: getContainer(),
    );
  }

  CustomAppBar getAppBar() {
    switch (state) {
      case StateManager.error:
        return const CustomAppBar(title: "Error");
      case StateManager.loading:
        return const CustomAppBar(title: "Loading");
      case StateManager.empty:
        return const CustomAppBar(title: "Empty");
    }
  }

  Center getContainer() {
    switch (state) {
      case StateManager.error:
        return const Center(
          child: Text("Beklenmedik hata oluştu"),
        );
      case StateManager.loading:
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.orange,
        ));
      case StateManager.empty:
        return const Center(
          child: Text("Boş Liste"),
        );
    }
  }
}
