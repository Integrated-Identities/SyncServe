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
  ValidatedTextField({
    super.key,
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    bool isRequired = false,
    EdgeInsets padding = const EdgeInsets.symmetric(vertical: 5),
    AutovalidateMode autovalidateMode = AutovalidateMode.always,
    required void Function(String?) onChanged,
    required InputDecoration decoration,
  }) {
    this.validator = validator;
    this.autovalidateMode = autovalidateMode;
    this.padding = padding;
    this.controller = controller;
    this.keyboardType = keyboardType;
    this.maxLines = maxLines;
    this.onChanged = onChanged;
    this.decoration = decoration;
  }

  late final String? Function(String?)? validator;
  late final AutovalidateMode autovalidateMode;
  late final EdgeInsets padding;
  late final TextEditingController controller;
  late final TextInputType keyboardType;
  late final int maxLines;
  late final void Function(String?) onChanged;
  late final InputDecoration decoration;

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
