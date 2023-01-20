import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class LightDarkButton extends StatefulWidget {
  const LightDarkButton({super.key});

  @override
  State<LightDarkButton> createState() => _LightDarkButtonState();
}

class _LightDarkButtonState extends State<LightDarkButton> {
  bool _dark_mode = false;

  void _pressed() {
    setState(() {
      _dark_mode = !_dark_mode;
    });

    if (_dark_mode) {
      AdaptiveTheme.of(context).setDark();
    } else {
      AdaptiveTheme.of(context).setLight();
    }
  }

  @override
  void initState() {
    _dark_mode = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _pressed,
      icon: _dark_mode
          ? const Icon(Icons.brightness_2)
          : const Icon(Icons.wb_sunny),
      tooltip: _dark_mode ? "Change to dark mode" : "Change to light mode",
    );
  }
}
