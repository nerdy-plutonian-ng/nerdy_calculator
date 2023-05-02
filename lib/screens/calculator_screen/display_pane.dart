import 'package:flutter/material.dart';
import 'package:nerdy_calculator/screens/calculator_screen/calculator_screen_viewmodel.dart';
import 'package:provider/provider.dart';

class DisplayPane extends StatelessWidget {
  const DisplayPane({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<CalculatorViewModel>(
            builder: (_, state, __) {
              return Text(state.display,
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.end);
            },
          ),
        ));
  }
}
