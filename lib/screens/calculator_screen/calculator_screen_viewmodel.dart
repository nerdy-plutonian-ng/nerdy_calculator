import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:nerdy_calculator/data/history_saver.dart';
import 'package:nerdy_calculator/data/pad_items.dart';
import 'package:nerdy_calculator/models/pad_item_type.dart';
import 'package:nerdy_calculator/screens/calculator_screen/calculator.dart';

import '../../models/pad_item.dart';

class CalculatorViewModel with ChangeNotifier {
  CalculatorViewModel() {
    getHistory();
  }

  var paneIndex = 0;

  changePane() {
    paneIndex = paneIndex == 0 ? 1 : 0;
    notifyListeners();
  }

  static const _padItems = padItems;

  final format = NumberFormat('#,##0.###');

  var _operation = '';
  String display = '';
  String _memory = '';
  String _operator = '';
  String get operator => _operator;
  bool shouldReset = false;

  List<String> _history = [];
  List<String> get history => _history;

  Future<void> getHistory() async {
    _history = await HistorySaver().getHistory();
    notifyListeners();
  }

  Future<bool> removeFromHistory(int index) async {
    return HistorySaver().removeFromHistory(index).then((result) {
      if (result) {
        getHistory();
      }
      return result;
    });
  }

  addToHistory() async {
    HistorySaver().addToHistory(_operation).then((result) {
      if (result) {
        getHistory().then((value) {
          _operation = '';
        });
      }
    });
  }

  //getPadRows
  Map<int, List<PadItem>> getRows({bool isLandscaped = false}) {
    final padItems = _padItems
        .where((element) => isLandscaped ? true : !element.isAdvanced)
        .toList();
    final padItemsMap = <int, List<PadItem>>{};
    var index = 0;
    var row = 0;
    while (index < padItems.length) {
      if (padItems.length - index > (isLandscaped ? 5 : 4)) {
        padItemsMap[row] =
            padItems.sublist(index, index + (isLandscaped ? 5 : 4));
        index += (isLandscaped ? 5 : 4);
        row++;
      } else {
        padItemsMap[row] =
            padItems.sublist(index, index + (padItems.length - index));
        index += (padItems.length - index);
        row++;
      }
    }
    return padItemsMap;
  }

  receiveInput(PadItem item) {
    _operation += '${item.label} ';
    switch (item.type) {
      case PadItemType.unaryOperator:
        if (item.label == 'CE') {
          display = '';
          _memory = '';
          _operator = '';
          _operation = '';
        } else if (item.label == 'C') {
          if (display.length > 1) {
            display = display.substring(0, display.length - 1);
          } else {
            display = '';
          }
        } else if (item.label == '+/-') {
          if (display.isNotEmpty && display != '.') {
            display = (num.parse(display) * -1).toString();
          }
        } else {
          if (display.isNotEmpty && item.label != '.') {
            display = format.format(Calculator.calculate(
              format.parse(display),
              item.label,
            ));
          }
        }
        break;
      case PadItemType.binaryOperator:
        if (item.label == '=') {
          if (_operator.isNotEmpty &&
              _memory.isNotEmpty &&
              display.isNotEmpty) {
            display = format.format(Calculator.calculate(
              format.parse(_memory),
              _operator,
              format.parse(display),
            ));
            _operation += display;
            addToHistory();
            _memory = '';
            _operator = '';
          }
        } else {
          if (_operator.isNotEmpty && _memory.isNotEmpty) {
            display = format.format(Calculator.calculate(
              format.parse(_memory),
              _operator,
              format.parse(display),
            ));
            _memory = '';
          }
          _operator = item.label;
        }

        break;
      case PadItemType.number:
        if (display.contains('.') && item.label == '.') {
          break;
        }
        if (operator.isNotEmpty && _memory.isEmpty) {
          _memory = display;
          display = item.label;
        } else {
          display += item.label;
        }
        break;
    }
    notifyListeners();
  }
}
