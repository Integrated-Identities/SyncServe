import 'package:syncserve/enums/service_checklist.dart';

class ServiceChecklistItem {
  ServiceChecklistItem({
    required this.label,
    required this.flag,
    this.isChecked = false,
  });

  /// The label for the checklist item.
  final String label;
  bool isChecked;
  final ServiceChecklistFlag flag;
}
