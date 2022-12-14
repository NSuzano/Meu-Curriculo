import 'package:flutter/material.dart';
import 'package:app_novo/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class BotaoMudarTema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
        value: themeProvider.isDarkMode,
        onChanged: (value) {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(value);
        });
  }
}
