import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      this.onChanged,
      this.fieldName,
      this.obsecureText,
      this.type});
  Function(String)? onChanged;
  String? fieldName;
  bool? obsecureText;
  TextInputType? type;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type != null ? type! : TextInputType.text,
      obscureText: obsecureText != null ? obsecureText! : false,
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 74, 136, 190)),
        ),
        hintText: fieldName,
      ),
    );
  }
}
