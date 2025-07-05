import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/enums/service_checklist.dart';
import 'package:syncserve/model/service_checklist_model.dart';
import 'package:syncserve/providers/service_checklist_providers.dart';
import 'package:syncserve/utils/flags.dart';

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
    final flags = EnumFlags<ServiceChecklistFlag>();

    for (final item in items) {
      if (item.isChecked) {
        flags.add(item.flag);
      }
    }
    ref.read(serviceChecklistProvider.notifier).state = flags;
  }

  void reset() {
    for (var item in items) {
      item.isChecked = false;
    }
  }

  late List<ServiceChecklistItem> items;
}
