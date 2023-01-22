import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';

class LightDarkButton extends StatefulWidget {
  const LightDarkButton({super.key});

  @override
  State<LightDarkButton> createState() => _LightDarkButtonState();
}

class _LightDarkButtonState extends State<LightDarkButton> {
  bool _darkMode = SystemTheme.isDarkMode;

  void _pressed() {
    setState(() {
      _darkMode = !_darkMode;
    });

    if (_darkMode) {
      AdaptiveTheme.of(context).setDark();
    } else {
      AdaptiveTheme.of(context).setLight();
    }
  }

  @override
  void initState() {
    super.initState();
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
