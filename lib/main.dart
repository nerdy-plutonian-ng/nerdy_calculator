import 'package:flutter/material.dart';
import 'package:nerdy_calculator/theme/app_theme.dart';

import 'screens/calculator_screen.dart';

void main() {
  runApp(const NerdyCalculator());
}

class NerdyCalculator extends StatelessWidget {
  const NerdyCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nerdy Calculator',
      theme: appTheme(),
      home: const CalculatorScreen(),
    );
  }
}
