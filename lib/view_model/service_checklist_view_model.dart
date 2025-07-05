import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/enums/service_checklist.dart';
import 'package:syncserve/model/service_checklist_model.dart';
import 'package:syncserve/providers/service_checklist_providers.dart';

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
  void save(WidgetRef ref) {
    ref.read(serviceChecklistProvider.notifier).state = items;
  }

  void reset() {
    for (var i = 0; i < items.length; i++) {
      items[i] = ServiceChecklistItem(
        label: items[i].label,
        flag: items[i].flag,
      );
    }
  }

  late List<ServiceChecklistItem> items;
}
