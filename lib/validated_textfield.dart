import 'package:flutter/material.dart';

class ValidatedTextField extends StatelessWidget {
  const ValidatedTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.onChanged,
    required this.decoration,
    this.autovalidateMode = AutovalidateMode.always,
    this.padding = const EdgeInsets.symmetric(vertical: 5),
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.isRequired = false,
    this.label,
  });

  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;
  final EdgeInsets padding;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLines;
  final void Function(String?) onChanged;
  final InputDecoration? decoration;
  final bool isRequired;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: validator,
        onChanged: onChanged,
        autovalidateMode: autovalidateMode,
        decoration: decoration,
      ),
    );
  }
}
