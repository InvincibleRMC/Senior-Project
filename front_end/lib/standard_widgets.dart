import 'package:flutter/material.dart';

import 'light_dark.dart';

abstract class StandardWidgets {
  static AppBar standardAppBar() {
    return AppBar(
        title: const Text("CWRU Plan+"),
        actions: const <Widget>[LightDarkButton()]);
  }
}
