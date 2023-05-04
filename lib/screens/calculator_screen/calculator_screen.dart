import 'package:flutter/material.dart';
import 'package:nerdy_calculator/screens/calculator_screen/calculator_screen_viewmodel.dart';
import 'package:nerdy_calculator/screens/calculator_screen/display_pane.dart';
import 'package:nerdy_calculator/screens/calculator_screen/pad.dart';
import 'package:provider/provider.dart';

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
              if (deviceWidth > 600)
                Expanded(
                    child: HistoryWidget(
                  isLandscaped: deviceWidth > 600,
                )),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                        child: GestureDetector(
                            onVerticalDragEnd: deviceWidth > 600
                                ? null
                                : (drag) {
                                    if (drag.velocity.pixelsPerSecond.dy >
                                        200) {
                                      Provider.of<CalculatorViewModel>(context,
                                              listen: false)
                                          .changePane();
                                    }
                                  },
                            onVerticalDragDown: (dragDetails) {},
                            child: Provider.of<CalculatorViewModel>(context)
                                        .paneIndex ==
                                    0
                                ? DisplayPane(isLandscaped: deviceWidth > 600)
                                : HistoryWidget(
                                    isLandscaped: deviceWidth > 600,
                                  ))),
                    Expanded(
                        flex: deviceWidth > 600 ? 3 : 2,
                        child: FittedBox(
                            child: Pad(isLandscaped: deviceWidth > 600))),
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
