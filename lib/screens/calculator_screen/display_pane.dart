import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calculator_screen_viewmodel.dart';

class DisplayPane extends StatelessWidget {
  const DisplayPane({Key? key, required this.isLandscaped}) : super(key: key);

  final bool isLandscaped;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Consumer<CalculatorViewModel>(
              builder: (_, state, __) {
                return Text(state.display,
                    style: isLandscaped
                        ? Theme.of(context).textTheme.displayMedium
                        : Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.end);
              },
            ),
          )),
    );
  }
}
