import 'package:flutter/material.dart';
import 'package:nerdy_calculator/screens/calculator_screen/calculator_screen_viewmodel.dart';
import 'package:provider/provider.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'History',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Expanded(child: Consumer<CalculatorViewModel>(
          builder: (_, state, __) {
            return state.history.isEmpty
                ? const Text(
                    'Your history will appear here',
                  )
                : ListView.builder(
                    itemCount: state.history.length,
                    itemBuilder: (_, index) {
                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Theme.of(context).colorScheme.error,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Icon(Icons.delete,
                                  color: Theme.of(context).colorScheme.onError),
                            ),
                          ),
                        ),
                        key: ValueKey(state.history[index]),
                        onDismissed: (_) {
                          state.removeFromHistory(index);
                        },
                        child: ListTile(
                          title: Text(state.history[index]),
                        ),
                      );
                    },
                  );
          },
        )),
      ],
    );
  }
}
