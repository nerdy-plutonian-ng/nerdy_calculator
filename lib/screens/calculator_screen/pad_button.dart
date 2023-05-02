import 'package:flutter/material.dart';
import 'package:nerdy_calculator/screens/calculator_screen/calculator_screen_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../models/pad_item.dart';
import '../../models/pad_item_type.dart';

class PadButton extends StatelessWidget {
  const PadButton({Key? key, required this.item, this.isLandscaped = false})
      : super(key: key);

  final PadItem item;
  final bool isLandscaped;

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorViewModel>(
      builder: (_, state, __) {
        return GestureDetector(
          onTap: () {
            state.clickButton(item);
          },
          child: Container(
            height: isLandscaped ? 48 : 80,
            width: isLandscaped ? 96 : 80,
            decoration: BoxDecoration(
              shape: isLandscaped ? BoxShape.rectangle : BoxShape.circle,
              borderRadius: isLandscaped
                  ? const BorderRadius.all(Radius.circular(32))
                  : null,
              color: item.type == PadItemType.number
                  ? Theme.of(context).colorScheme.primaryContainer
                  : item.type == PadItemType.binaryOperator
                      ? Theme.of(context).colorScheme.tertiaryContainer
                      : Theme.of(context).colorScheme.secondaryContainer,
            ),
            child: Center(
              child: Text(
                item.label,
                textAlign: TextAlign.center,
                style: isLandscaped
                    ? Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: item.type == PadItemType.number
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : item.type == PadItemType.binaryOperator
                                ? Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer
                                : Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer)
                    : Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: item.type == PadItemType.number
                              ? Theme.of(context).colorScheme.onPrimaryContainer
                              : item.type == PadItemType.binaryOperator
                                  ? Theme.of(context)
                                      .colorScheme
                                      .onTertiaryContainer
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                        ),
              ),
            ),
          ),
        );
      },
    );
  }
}
