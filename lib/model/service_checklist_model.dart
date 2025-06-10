class ServiceChecklistItem {
  ServiceChecklistItem({required this.label, this.isChecked = false});

  /// The label for the checklist item.
  final String label;

  /// Has the user completed this checklist item?
  bool isChecked;
}
