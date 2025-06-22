import 'package:flutter/material.dart';

class ValidatedTextField extends StatelessWidget {
  ValidatedTextField({
    super.key,
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
    required InputDecoration decoration,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    bool isRequired = false,
    EdgeInsets padding = const EdgeInsets.symmetric(vertical: 5),
    AutovalidateMode autovalidateMode = AutovalidateMode.onUnfocus,
    void Function(String?)? onChanged,
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
  late final void Function(String?)? onChanged;
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
