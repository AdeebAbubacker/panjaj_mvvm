import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panakj_app/core/constant/constants.dart';

class Marksdetails extends StatelessWidget {
  final String title;

  Marksdetails({Key? key, this.title = 'SSLC Marks'}) : super(key: key);

  TextEditingController marks = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: kCardContentStyle),
        SizedBox(
          width: 90,
          height: 30,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  controller: marks,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(7),
                    TextInputFormater(decimalDigits: 2,integerDigits: 2),
                  ],
                  style: kCardContentStyle, // Set font size to 8
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TextInputFormater extends TextInputFormatter {
  final int integerDigits;
  final int decimalDigits;

  TextInputFormater({required this.integerDigits, required this.decimalDigits});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Check if the text is empty and remove '%' if necessary
    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove any non-numeric and non-decimal characters
    newText = newText.replaceAll(RegExp(r'[^0-9.]'), '');

    // Check if the decimal point is present
    if (newText.contains('.')) {
      List<String> parts = newText.split('.');

      // Limit the length of the integer part to the specified digits
      if (parts[0].length > integerDigits) {
        newText = oldValue.text;
      }

      // Limit the decimal part to the specified digits
      if (parts.length == 2 && parts[1].length > decimalDigits) {
        newText = '${parts[0]}.${parts[1].substring(0, decimalDigits)}';
      }
    } else {
      // Limit the length of the entire input to the specified digits
      if (newText.length > integerDigits) {
        newText = oldValue.text;
      }
    }

    // Add '%' at the end if not present
    if (!newText.endsWith('%')) {
      newText += ' %';
    }

    return newValue.copyWith(text: newText);
  }
}

