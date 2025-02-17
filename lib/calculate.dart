import 'package:math_expressions/math_expressions.dart';

class Calculate {
  Calculate({required this.result});
  final String? result;

  String getResult() {
    if (result == null || result!.isEmpty) {
      return "Invalid expression"; // Handle null or empty case
    }

    try {
      String expression = result!;
      Parser parser = Parser();
      Expression exp = parser.parse(expression);

      ContextModel contextModel = ContextModel();

      // Evaluate the expression
      dynamic evaluatedResult;

      try {
        evaluatedResult = exp.evaluate(EvaluationType.REAL, contextModel);
        if (evaluatedResult is double) {
          if (evaluatedResult.isNaN) {
            return 'NaN';
          } else if (evaluatedResult == evaluatedResult.toInt()) {
            return evaluatedResult
                .toInt()
                .toString(); // Return as integer if the result has no decimal part
          } else if (evaluatedResult.isInfinite) {
            return 'Infinity';
          } else {
            return evaluatedResult.toStringAsFixed(
                2); // Return as a decimal with two decimal places
          }
        } else {
          return evaluatedResult
              .toString(); // Return the result as a string if it's not a double
        }
      } catch (e) {
        if (e is UnsupportedError) {
          return 'Undefined';
        } else {
          return 'Unexpected Error';
        }
      }
    } catch (e) {
      return "Error: ${e.toString()}"; // Handle parsing or evaluation errors
    }
  }
}
