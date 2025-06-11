import 'package:flutter/material.dart';
import 'package:syncserve/theme/styles.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.padding = EdgeInsets.zero,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function(bool) onChanged;

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
              style: AppStyle.labelText,
            ),
          ],
        ),
      ),
    );
  }
}
