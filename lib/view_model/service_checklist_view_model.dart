import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/model/service_checklist_model.dart';

class ServiceChecklistViewModel {
  ServiceChecklistViewModel(AppLocalizations localizations) {
    items = [
      ServiceChecklistItem(label: localizations.batteryUPSCleaned),
      ServiceChecklistItem(label: localizations.blowerChanged),
      ServiceChecklistItem(label: localizations.upsConnectionTight),
      ServiceChecklistItem(label: localizations.batteryWaterLevel),
      ServiceChecklistItem(label: localizations.coolingFan),
      ServiceChecklistItem(label: localizations.backUpTest),
      ServiceChecklistItem(label: localizations.staticBypass),
      ServiceChecklistItem(label: localizations.panelReadingMatched),
      ServiceChecklistItem(label: localizations.historyCardEntry),
      ServiceChecklistItem(label: localizations.equipmentOk),
    ];
  }

  late final List<ServiceChecklistItem> items;
}
