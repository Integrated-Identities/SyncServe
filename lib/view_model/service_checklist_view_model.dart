import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/enums/service_checklist.dart';
import 'package:syncserve/model/service_checklist_model.dart';

class ServiceChecklistViewModel {
  ServiceChecklistViewModel(AppLocalizations localizations) {
    items = [
      ServiceChecklistItem(
        label: localizations.batteryUPSCleaned,
        flag: ServiceChecklistFlag.batterycleaned,
      ),
      ServiceChecklistItem(
        label: localizations.blowerChanged,
        flag: ServiceChecklistFlag.blowerchanged,
      ),
      ServiceChecklistItem(
        label: localizations.upsConnectionTight,
        flag: ServiceChecklistFlag.upsConnectionTightened,
      ),
      ServiceChecklistItem(
        label: localizations.batteryWaterLevel,
        flag: ServiceChecklistFlag.batteryWaterLevelChecked,
      ),
      ServiceChecklistItem(
        label: localizations.coolingFan,
        flag: ServiceChecklistFlag.coolingFanWorks,
      ),
      ServiceChecklistItem(
        label: localizations.backUpTest,
        flag: ServiceChecklistFlag.backupChecked,
      ),
      ServiceChecklistItem(
        label: localizations.staticBypass,
        flag: ServiceChecklistFlag.staticBypassChecked,
      ),
      ServiceChecklistItem(
        label: localizations.panelReadingMatched,
        flag: ServiceChecklistFlag.panelReadingMatched,
      ),
      ServiceChecklistItem(
        label: localizations.historyCardEntry,
        flag: ServiceChecklistFlag.historyCardEntered,
      ),
      ServiceChecklistItem(
        label: localizations.equipmentOk,
        flag: ServiceChecklistFlag.equipmentIsOK,
      ),
    ];
  }

  late final List<ServiceChecklistItem> items;
}
