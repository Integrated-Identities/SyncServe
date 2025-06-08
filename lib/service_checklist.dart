import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/styles.dart';
import 'service_checklist_constant.dart';

class ServiceChecklist extends StatefulWidget {
  const ServiceChecklist({super.key});

  @override
  State<ServiceChecklist> createState() => ServiceChecklistState();
}

class ServiceChecklistState extends State<ServiceChecklist> {
  late List<bool> isTickList;
  late List<String> checklistLabels;

  @override
  void initState() {
    super.initState();
    isTickList = List.generate(10, (_) => false);
  }

  Widget buildCheckboxRow(int index, String label) {
    return CheckboxListTile(
      value: isTickList[index],
      onChanged: (bool? value) {
        setState(() {
          isTickList[index] = value ?? false;
        });
      },
      title: Text(
        label,
        style: AppStyle.labelText,
      ),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: ServiceChecklistItems.checkbox,
      checkColor: ServiceChecklistItems.checkTickBox,
    );
  }

  @override
  Widget build(BuildContext context) {
    checklistLabels = ServiceChecklistItems.getChecklistLabels(context)
        .map((item) => item.label)
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.appBarAndNavBarColor,
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            for (int i = 0; i < checklistLabels.length; i++)
              buildCheckboxRow(i, checklistLabels[i]),
            Spacer(),
            Padding(
              padding: AppStyle.elevatedButtonPadding,
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
