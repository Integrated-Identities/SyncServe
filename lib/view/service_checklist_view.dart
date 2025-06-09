import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/styles.dart';
import 'package:syncserve/viewmodel/service_checklist_viewmodel.dart';

class ServiceChecklist extends StatelessWidget {
  const ServiceChecklist({super.key});

  @override
  Widget build(BuildContext context) {
    return const ServiceChecklistView();
  }
}

class ServiceChecklistView extends StatefulWidget {
  const ServiceChecklistView({super.key});

  @override
  State<ServiceChecklistView> createState() => _ServiceChecklistViewState();
}

class _ServiceChecklistViewState extends State<ServiceChecklistView> {
  final viewmodel = ServiceChecklistViewmodel();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewmodel.initialize(AppLocalizations.of(context)!);
  }

  void toggleCheck(int index) {
    setState(() {
      viewmodel.toggleCheck(index);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              child: ListView.builder(
                itemCount: viewmodel.items.length,
                itemBuilder: (context, index) {
                  final item = viewmodel.items[index];
                  return CheckboxListTile(
                    value: item.isChecked,
                    onChanged: (_) => toggleCheck(index),
                    title: Text(item.label),
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                },
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
