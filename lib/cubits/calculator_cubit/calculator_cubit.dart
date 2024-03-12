import 'package:bloc/bloc.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/cubits/calculator_cubit/calculator_states.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  String userInput = '';
  String result = '0';
  CalculatorCubit() : super(CalculatorInitialState());

  void handleButtonPressed(String buttonText) {
    if (buttonText == 'C') {
      userInput = '';
      result = '0';
    } else if (buttonText == '⌦') {
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
      }
    } else if (userInput.isEmpty ||
        _isOperator(userInput[userInput.length - 1])) {
      userInput += buttonText;
    } else if (buttonText == '=') {
      if (!_isOperator(userInput[userInput.length - 1])) {
        userInput = userInput.replaceAll('×', '*').replaceAll('÷', '/');
        Parser p = Parser();
        Expression ex = p.parse(userInput);
        double res = ex.evaluate(EvaluationType.REAL, ContextModel());
        if (res == res.toInt().toDouble()) {
          userInput = res.toInt().toString();
        } else {
          userInput = res.toStringAsFixed(2);
        }
        result = res.toString();
      }
    } else {
      if (userInput == '0') {
        userInput = buttonText;
      } else {
        userInput += buttonText;
      }
    }
    emit(UpdatedState(
      userInput,
    ));
  }

  bool _isOperator(String char) {
    return char == '×' ||
        char == '-' ||
        char == '%' ||
        char == '÷' ||
        char == '+';
  }
}
