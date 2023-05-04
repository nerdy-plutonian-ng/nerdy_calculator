import 'package:flutter/material.dart';
import 'package:nerdy_calculator/screens/calculator_screen/calculator_screen_viewmodel.dart';
import 'package:nerdy_calculator/theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'screens/calculator_screen/calculator_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => CalculatorViewModel(),
    child: const NerdyCalculator(),
  ));
}

class NerdyCalculator extends StatelessWidget {
  const NerdyCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nerdy Calculator',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const CalculatorScreen(),
    );
  }
}
