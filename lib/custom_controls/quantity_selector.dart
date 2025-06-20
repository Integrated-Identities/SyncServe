import 'package:flutter/material.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({
    super.key,
    this.initialValue = 1,
    this.onChanged,
    this.minValue = 0,
    this.maxValue = 999,
  });
  final int initialValue;
  final ValueChanged<int>? onChanged;
  final int minValue;
  final int maxValue;

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialValue;
  }

  void _increment() {
    if (_quantity < widget.maxValue) {
      setState(() {
        _quantity++;
      });
      widget.onChanged?.call(_quantity);
    }
  }

  void _decrement() {
    if (_quantity > widget.minValue) {
      setState(() {
        _quantity--;
      });
      widget.onChanged?.call(_quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: _decrement,
          style: AppStyle.quantitySelectorButtonStyle(),
          child: Text(
            AppLocalizations.of(context)!.minusSign,
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
        Text(
          _quantity.toString(),
          textAlign: TextAlign.center,
          style: AppStyle.labelText,
        ),
        ElevatedButton(
          onPressed: _increment,
          style: AppStyle.quantitySelectorButtonStyle(),
          child: Text(
            AppLocalizations.of(context)!.plusSign,
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
