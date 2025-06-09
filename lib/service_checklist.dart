import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:syncserve/styles.dart';
import 'package:syncserve/service_checklist_viewmodel.dart';

class ServiceChecklist extends StatelessWidget {
  const ServiceChecklist({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final vm = ServiceChecklistItems();
        vm.loadItems(context);
        return vm;
      },
      child: const ServiceChecklistView(),
    );
  }
}

class ServiceChecklistView extends StatelessWidget {
  const ServiceChecklistView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ServiceChecklistItems>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.appBarAndNavBarColor,
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ListView(
                children: [
                  for (int i = 0; i < vm.items.length; i++)
                    CheckboxListTile(
                      activeColor: AppStyle.checkBoxColor,
                      checkColor: AppStyle.checkBoxTickColor,
                      value: vm.items[i].isChecked,
                      onChanged: (_) => vm.toggleCheck(i),
                      title: Text(
                        vm.items[i].label,
                        style: AppStyle.labelText,
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                ],
              ),
            ),
          ),
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
    );
  }
}
