import 'package:flutter/material.dart';

import 'color_schemes.g.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  fontFamily: 'Quicksand',
  textTheme: textTheme,
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  fontFamily: 'Quicksand',
  textTheme: textTheme,
);

const textTheme = TextTheme(
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
);
