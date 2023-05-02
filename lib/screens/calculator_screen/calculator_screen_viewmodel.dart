import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:nerdy_calculator/data/pad_items.dart';
import 'package:nerdy_calculator/models/pad_item_type.dart';

import '../../models/pad_item.dart';
import 'binary_calculator.dart';

class CalculatorViewModel with ChangeNotifier {
  static const _padItems = padItems;

  String _display = '0';
  String _memory = '';
  String _operator = '';
  String get display => NumberFormat('#,###.##').format(num.parse(_display));

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

  clickButton(PadItem item) {
    switch (item.type) {
      case PadItemType.unaryOperator:
        if (item.label == 'CE') {
          _display = '0';
          _memory = '';
          _operator = '';
        } else if (item.label == '+/-') {
          _display = (num.parse(_display) * -1).toString();
        } else if (item.label == 'C') {
          if (_display.length > 1) {
            _display = _display.substring(0, _display.length - 1);
          } else {
            _display = '0';
          }
        } else if (item.label == 'sin') {
          _display =
              sin(num.parse(_display.isEmpty ? '0' : _display) * pi / 180)
                  .toStringAsFixed(2);
        } else if (item.label == 'cos') {
          _display =
              cos(num.parse(_display.isEmpty ? '0' : _display) * pi / 180)
                  .toStringAsFixed(2);
        } else if (item.label == 'tan') {
          _display =
              tan(num.parse(_display.isEmpty ? '0' : _display) * pi / 180)
                  .toStringAsFixed(2);
        }
        break;
      case PadItemType.binaryOperator:
        if (item.label == '=') {
          _display = BinaryCalculator.calculate(
                  num.parse(_memory.isEmpty ? '0' : _memory),
                  _operator,
                  num.parse(_display.isEmpty ? '0' : _display))
              .toStringAsFixed(2);
          _memory = '';
        } else {
          if (_operator.isNotEmpty) {
            if (_operator == '=') {
              _memory = _display;
            } else {
              _display = BinaryCalculator.calculate(
                      num.parse(_memory.isEmpty ? '0' : _memory),
                      _operator,
                      num.parse(_display.isEmpty ? '0' : _display))
                  .toStringAsFixed(2);
            }
          }
        }
        _operator = item.label;
        break;
      case PadItemType.number:
        if (_display.contains('.') && item.label == '.') {
          break;
        }
        if (_operator.isNotEmpty) {
          if (_operator == '=') {
            _operator = '';
          } else {
            _memory = _display;
          }
          _display = item.label;
        } else {
          _display += item.label;
        }
        break;
      default:
        break;
    }
    notifyListeners();
  }
}
