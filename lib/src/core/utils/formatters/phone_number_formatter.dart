class PhoneNumberFormatter {
  String format({
    required String oldValue,
    required String formattedText,
  }) {
    // Remove any character that is not a digit
    String newText = oldValue.replaceAll(RegExp(r'[^0-9]'), '');

    if (newText.length > 10) {
      newText = newText.substring(0, 10);
    }

    if (newText.isNotEmpty) {
      if (newText.isNotEmpty) {
        formattedText += '(${newText.substring(0, 3)}';
      }
      if (newText.length > 3) {
        formattedText += ') ${newText.substring(3, 6)}';
      }
      if (newText.length > 6) {
        formattedText += '-${newText.substring(6, 8)}';
      }
      if (newText.length > 8) {
        formattedText += '-${newText.substring(8, 10)}';
      }
    }

    return formattedText;
  }
}
