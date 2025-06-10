import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:syncserve/view_model/service_checklist_view_model.dart';

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
  _ServiceChecklistViewState() {
    // Initialize the viewModel with the current AppLocalizations context
    viewModel = ServiceChecklistViewModel(AppLocalizations.of(context)!);
  }

  late final ServiceChecklistViewModel viewModel;

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
                itemCount: viewModel.items.length,
                itemBuilder: (context, index) {
                  final item = viewModel.items[index];
                  return CheckboxListTile(
                    value: item.isChecked,
                    onChanged: (newValue) => item.isChecked = newValue ?? false,
                    title: Text(item.label),
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: AppStyle.bottomAreaPadding,
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
