import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ServiceChecklistItem {
  final String label;
  bool isChecked;

  // ignore: sort_constructors_first
  ServiceChecklistItem({required this.label, this.isChecked = false});
}

class ServiceChecklistItems {
  static const Color checkbox = Color.fromARGB(255, 237, 125, 125);
  static const Color checkTickBox = Colors.white;

  static List<ServiceChecklistItem> getChecklistLabels(BuildContext context) {
    return [
      ServiceChecklistItem(
          label: AppLocalizations.of(context)!.batteryUPSCleaned,),
      ServiceChecklistItem(label: AppLocalizations.of(context)!.blowerChanged),
      ServiceChecklistItem(
          label: AppLocalizations.of(context)!.upsConnectionTight,),
      ServiceChecklistItem(
          label: AppLocalizations.of(context)!.batteryWaterLevel,),
      ServiceChecklistItem(label: AppLocalizations.of(context)!.coolingFan),
      ServiceChecklistItem(label: AppLocalizations.of(context)!.backUpTest),
      ServiceChecklistItem(label: AppLocalizations.of(context)!.staticBypass),
      ServiceChecklistItem(
          label: AppLocalizations.of(context)!.panelReadingMatched,),
      ServiceChecklistItem(
          label: AppLocalizations.of(context)!.historyCardEntry,),
      ServiceChecklistItem(label: AppLocalizations.of(context)!.equipmentOk),
    ];
  }
}
