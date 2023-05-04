import 'dart:math';

class Calculator {
  static num calculate(num leftOperand, String operator, [num? rightOperand]) {
    final secondOperand = rightOperand ?? 0;
    switch (operator) {
      case '+':
        return leftOperand + secondOperand;
      case '-':
        return leftOperand - secondOperand;
      case 'x':
        return leftOperand * secondOperand;
      case '/':
        return leftOperand / secondOperand;
      case '%':
        return leftOperand % secondOperand;
      case 'x^X':
        return pow(leftOperand, secondOperand);
      case '+/-':
        return leftOperand * -1;
      case 'cos':
        return cos(leftOperand * pi / 180);
      case 'sin':
        return sin(leftOperand * pi / 180);
      case 'tan':
        return tan(leftOperand * pi / 180);
      default:
        return 0;
    }
  }
}
