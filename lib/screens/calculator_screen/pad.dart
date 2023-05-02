import 'package:flutter/material.dart';
import 'package:nerdy_calculator/screens/calculator_screen/pad_button.dart';
import 'package:provider/provider.dart';

import 'calculator_screen_viewmodel.dart';

class Pad extends StatelessWidget {
  const Pad({Key? key, required this.isLandscaped}) : super(key: key);

  final bool isLandscaped;

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorViewModel>(builder: (_, state, __) {
      final padItems = state.getRows(isLandscaped: isLandscaped);
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (var key in padItems.keys)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var item in padItems[key]!)
                    PadButton(
                      item: item,
                      isLandscaped: isLandscaped,
                    )
                ],
              )
          ]);
    });
  }
}
