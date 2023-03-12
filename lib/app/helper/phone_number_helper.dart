part of 'helper.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  PhoneNumberFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (!oldValue.text.contains("(") &&
        oldValue.text.length >= 15 &&
        newValue.text.length != oldValue.text.length) {
      return TextEditingValue(
        text: "",
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    if (oldValue.text.length > newValue.text.length) {
      return TextEditingValue(
        text: newValue.text.toString(),
        selection: TextSelection.collapsed(offset: newValue.text.length),
      );
    }

    var newText = newValue.text;
    if (newText.length == 1)
      newText.contains("0") ? newText = "+84" : newText = "+84" + newText;
    if (newText.length == 3) newText = newText + " ";
    if (newText.length == 7) newText = newText + " ";
    if (newText.length == 11) newText = newText + " ";

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
