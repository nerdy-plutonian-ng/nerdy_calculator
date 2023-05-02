import 'dart:math';

class BinaryCalculator {
  static num calculate(num leftOperand, String operator, num rightOperand) {
    switch (operator) {
      case '+':
        return leftOperand + rightOperand;
      case '-':
        return leftOperand - rightOperand;
      case 'x':
        return leftOperand * rightOperand;
      case '/':
        return leftOperand / rightOperand;
      case '%':
        return leftOperand % rightOperand;
      case 'xX':
        return pow(leftOperand, rightOperand);
      default:
        return 0;
    }
  }
}
