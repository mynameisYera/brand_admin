import 'package:flutter/services.dart';

class PriceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(' ₸', '');

    if (newText.isNotEmpty && newText.startsWith('0')) {
      newText = newText.replaceFirst('0', '');
    }
    newText = newText.replaceAll(RegExp(r'[^0-9]'), '');

    if (newText.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    return TextEditingValue(
      text: '$newText ₸',
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
