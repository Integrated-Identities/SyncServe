import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'service_checklist_model.dart';

class ServiceChecklistItems extends ChangeNotifier {
  late List<ServiceChecklistItem> checklistItems;

  List<ServiceChecklistItem> get items => checklistItems;

  void loadItems(BuildContext context) {
    checklistItems = [
      ServiceChecklistItem(
        label: AppLocalizations.of(context)!.batteryUPSCleaned,
      ),
      ServiceChecklistItem(label: AppLocalizations.of(context)!.blowerChanged),
      ServiceChecklistItem(
        label: AppLocalizations.of(context)!.upsConnectionTight,
      ),
      ServiceChecklistItem(
        label: AppLocalizations.of(context)!.batteryWaterLevel,
      ),
      ServiceChecklistItem(label: AppLocalizations.of(context)!.coolingFan),
      ServiceChecklistItem(label: AppLocalizations.of(context)!.backUpTest),
      ServiceChecklistItem(label: AppLocalizations.of(context)!.staticBypass),
      ServiceChecklistItem(
        label: AppLocalizations.of(context)!.panelReadingMatched,
      ),
      ServiceChecklistItem(
        label: AppLocalizations.of(context)!.historyCardEntry,
      ),
      ServiceChecklistItem(label: AppLocalizations.of(context)!.equipmentOk),
    ];
    notifyListeners();
  }

  void toggleCheck(int index) {
    checklistItems[index].isChecked = !checklistItems[index].isChecked;
    notifyListeners();
  }
}
