import 'package:ezy_buy/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProv = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Hello , World!",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w600,
            ),
          ),
          SwitchListTile(
              title: Text(themeProv.isDarkMode() ? "Dark mode" : "light mode"),
              value: themeProv.isDarkMode(),
              onChanged: (value) {
                themeProv.setThemeMode(themeValue: value);
              })
        ],
      ),
    );
  }
}
