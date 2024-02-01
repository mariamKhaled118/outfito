
import 'package:flutter/material.dart';

class text extends StatelessWidget {
  text({required this.controller, required this.hint});

  TextEditingController controller;
  String hint;

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurpleAccent),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        hintText: hint,
        hintStyle: TextStyle(),
      ),
      controller: controller,
      keyboardType:
          TextInputType.numberWithOptions(decimal: true, signed: false),
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required';
        } else if (!isNumeric(value)) {
          return 'Enter numbers only';
        } else if (hint == '  weight ') {
          double numberValue = double.parse(value!);
          if (numberValue <= 22.0 || numberValue > 136.0) {
            return ' Weight must be within the period [22.0 ,136.0]';
          }
        } else if (hint == ' Age ') {
          double numberValue = double.parse(value!);
          if (numberValue < 0 || numberValue > 117) {
            return ' Age must be within the period [0 ,117]';
          }
        } else if (hint == ' Height ') {
          double numberValue = double.parse(value!);

          if (numberValue <= 137.2 || numberValue > 193.1) {
            return ' height must be within the period [137.0,193.0]';
          }
        } else
          // Return null if the value is valid
          return null;
      },
    );
  }
}
