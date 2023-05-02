import 'package:flutter/material.dart';
import 'package:nerdy_calculator/screens/calculator_screen/display_pane.dart';
import 'package:nerdy_calculator/screens/calculator_screen/pad.dart';

import 'history.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              if (deviceWidth > 600) const Expanded(child: HistoryWidget()),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Expanded(child: DisplayPane()),
                    Expanded(
                        flex: deviceWidth > 600 ? 3 : 2,
                        child: Pad(isLandscaped: deviceWidth > 600)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
