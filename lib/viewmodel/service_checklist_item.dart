import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/model/service_checklist_model.dart';

List<ServiceChecklistItem> buildChecklistItems(AppLocalizations loc) {
  return [
    ServiceChecklistItem(label: loc.batteryUPSCleaned),
    ServiceChecklistItem(label: loc.blowerChanged),
    ServiceChecklistItem(label: loc.upsConnectionTight),
    ServiceChecklistItem(label: loc.batteryWaterLevel),
    ServiceChecklistItem(label: loc.coolingFan),
    ServiceChecklistItem(label: loc.backUpTest),
    ServiceChecklistItem(label: loc.staticBypass),
    ServiceChecklistItem(label: loc.panelReadingMatched),
    ServiceChecklistItem(label: loc.historyCardEntry),
    ServiceChecklistItem(label: loc.equipmentOk),
  ];
}
