import 'package:flutter/services.dart';

class CustomMaxValueInputFormatter extends TextInputFormatter {
  CustomMaxValueInputFormatter({
    this.maxInputValue,
    this.minInputValue,
    this.useInt = false,
    this.onlyNegative = false,
  });
  final double? maxInputValue;
  final double? minInputValue;

  final bool useInt;
  final bool onlyNegative;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    double? value = double.tryParse(newValue.text);
    if (value == null) {
      return newValue;
    }

    if (onlyNegative) {
      if (value > 0) {
        value *= -1;
      }
    }

    if (maxInputValue != null) {
      if (value > maxInputValue!) {
        return oldValue;
      }
    }

    if (minInputValue != null) {
      if (value < minInputValue!) {
        return oldValue;
      }
    }

    return newValue;
  }
}
