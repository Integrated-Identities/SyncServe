import 'package:syncserve/enums/service_checklist.dart';

class ServiceChecklistItem {
  ServiceChecklistItem({
    required this.label,
    this.isChecked = false,
    required this.flag,
  });

  /// The label for the checklist item.
  final String label;

  /// Has the user completed this checklist item?
  bool isChecked;

  final ServiceChecklistFlag flag;
}
