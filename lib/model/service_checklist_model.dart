import 'package:syncserve/enums/service_checklist.dart';

class ServiceChecklistItem {
  ServiceChecklistItem({
    required this.label,
    required this.flag,
  });

  /// The label for the checklist item.
  final String label;

  final ServiceChecklistFlag flag;
}
