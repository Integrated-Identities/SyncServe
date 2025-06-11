import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
    this.textStyle,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function(bool) onChanged;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: [
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue ?? false);
              },
            ),
            Text(
              label,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
