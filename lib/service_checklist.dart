import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/styles.dart';

class ServiceChecklist extends StatefulWidget {
  const ServiceChecklist({super.key});

  @override
  State<ServiceChecklist> createState() => _ServiceChecklistState();
}

class _ServiceChecklistState extends State<ServiceChecklist> {
  List<bool> isTick = List.generate(10, (value) => false);
  @override
  Widget build(BuildContext context) {
    final items = [
      AppLocalizations.of(context)!.batterUPScleaned,
      AppLocalizations.of(context)!.blowerChanged,
      AppLocalizations.of(context)!.upsConnectionTight,
      AppLocalizations.of(context)!.batteryWaterLevel,
      AppLocalizations.of(context)!.coolingFan,
      AppLocalizations.of(context)!.backUptest,
      AppLocalizations.of(context)!.staticBypass,
      AppLocalizations.of(context)!.panelReadingMatched,
      AppLocalizations.of(context)!.historyCardEntry,
      AppLocalizations.of(context)!.equipmentOk,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.appBarAndNavBarColor,
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            ...List.generate(
              items.length,
              (index) => Row(
                children: [
                  Checkbox(
                    value: isTick[index],
                    onChanged: (bool? value) {
                      setState(() {
                        isTick[index] = value ?? false;
                      });
                    },
                    checkColor: Colors.white,
                    activeColor: const Color.fromARGB(255, 237, 125, 125),
                  ),
                  Text(
                    items[index],
                    style: AppStyle.checkBoxTextStyle,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: ElevatedButton(
                style: AppStyle.elevatedButtonStyle(),
                onPressed: () {},
                child: Text(AppLocalizations.of(context)!.next),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
