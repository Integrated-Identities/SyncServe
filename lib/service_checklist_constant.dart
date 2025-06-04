import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ServiceChecklistItems {
  static List<String> getChecklistLabels(BuildContext context) {
    return [
      AppLocalizations.of(context)!.batteryUPSCleaned,
      AppLocalizations.of(context)!.blowerChanged,
      AppLocalizations.of(context)!.upsConnectionTight,
      AppLocalizations.of(context)!.batteryWaterLevel,
      AppLocalizations.of(context)!.coolingFan,
      AppLocalizations.of(context)!.backUpTest,
      AppLocalizations.of(context)!.staticBypass,
      AppLocalizations.of(context)!.panelReadingMatched,
      AppLocalizations.of(context)!.historyCardEntry,
      AppLocalizations.of(context)!.equipmentOk,
    ];
  }
}
