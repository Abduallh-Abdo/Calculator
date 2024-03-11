abstract class CalculatorState {}

class CalculatorInitialState extends CalculatorState {}

class UpdatedState extends CalculatorState {
  final String userInput;
  final String result;
  UpdatedState(this.userInput, this.result);
}
