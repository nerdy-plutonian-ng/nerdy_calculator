//unit tests for calculator class calculations

import 'package:flutter_test/flutter_test.dart';
import 'package:nerdy_calculator/screens/calculator_screen/calculator.dart';

main() {
  test('test 2 x^X 4', () {
    expect(Calculator.calculate(2, 'x^X', 4), 16);
  });

  test('test 2 + 4', () {
    expect(Calculator.calculate(2, '+', 4), 6);
  });

  test('test 2 - 4', () {
    expect(Calculator.calculate(2, '-', 4), -2);
  });

  test('test 2 / 4', () {
    expect(Calculator.calculate(2, '/', 4), 0.5);
  });

  test('test 43 % 4', () {
    expect(Calculator.calculate(43, '%', 4), 3);
  });

  test('test 2 x 4', () {
    expect(Calculator.calculate(2, 'x', 4), 8);
  });
}
