import 'package:flutter/material.dart';

import 'color_schemes.g.dart';

ThemeData appTheme({bool isDark = false}) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: isDark ? darkColorScheme : lightColorScheme,
    fontFamily: 'Quicksand',
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
