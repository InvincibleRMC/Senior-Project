import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class LightDarkButton extends StatefulWidget {
  const LightDarkButton({super.key});

  @override
  State<LightDarkButton> createState() => _LightDarkButtonState();
}

class _LightDarkButtonState extends State<LightDarkButton> {
  // Starts in Dark mode
  bool _darkMode = true;

  void _pressed() {
    setState(() {
      _darkMode = !_darkMode;
      AdaptiveTheme.of(context).toggleThemeMode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _pressed,
      icon: _darkMode
          ? const Icon(Icons.wb_sunny)
          : const Icon(Icons.brightness_2),
      tooltip: _darkMode ? "Switch to light theme" : "Switch to light theme",
    );
  }
}
