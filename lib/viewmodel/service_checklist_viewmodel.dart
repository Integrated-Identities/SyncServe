import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/model/service_checklist_model.dart';
import 'package:syncserve/viewmodel/service_checklist_item.dart';

class ServiceChecklistViewmodel {
  late List<ServiceChecklistItem> items;

  void initialize(AppLocalizations loc) {
    items = buildChecklistItems(loc);
  }

  void toggleCheck(int index) {
    items[index].isChecked = !items[index].isChecked;
  }
}
