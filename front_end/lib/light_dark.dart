import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class LightDarkButton extends StatefulWidget {
  const LightDarkButton({super.key});

  @override
  State<LightDarkButton> createState() => _LightDarkButtonState();
}

class _LightDarkButtonState extends State<LightDarkButton> {
  bool darkMode = false;

  void _pressed() {
    setState(() {
      darkMode = !darkMode;
    });

    if (darkMode) {
      AdaptiveTheme.of(context).setDark();
    } else {
      AdaptiveTheme.of(context).setLight();
    }
  }

  @override
  void initState() {
    super.initState();
    darkMode = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _pressed,
      icon: darkMode
          ? const Icon(Icons.brightness_2)
          : const Icon(Icons.wb_sunny),
      tooltip: darkMode ? "Change to dark mode" : "Change to light mode",
    );
  }
}
