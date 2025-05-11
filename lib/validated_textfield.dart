import 'package:flutter/material.dart';
import 'package:syncserve/styles.dart';

class Validatedtextfield extends StatelessWidget {
  const Validatedtextfield({
    super.key,
    required this.controller,
    required this.label,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.isRequired = false,
    this.padding = const EdgeInsets.symmetric(vertical: 5),
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool isRequired;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration:
            AppStyle.inputDecorationWithLabel(label, isRequired: isRequired),
      ),
    );
  }
}
