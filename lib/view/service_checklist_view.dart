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
  ServiceChecklistViewModel? viewModel;

  @override
  void initState() {
    super.initState();
    // Initialize after the widget is fully mounted
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        viewModel = ServiceChecklistViewModel(AppLocalizations.of(context)!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Add null check for viewModel
    if (viewModel == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.appBarAndNavBarColor,
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: ListView.builder(
                  itemCount: viewModel!.items.length,
                  itemBuilder: (context, index) {
                    final item = viewModel!.items[index];
                    return CheckboxListTile(
                      value: item.isChecked,
                      onChanged: (newValue) {
                        print(
                          'Checkbox changed: ${item.label}, new value: $newValue',
                        );
                        setState(() {
                          item.isChecked = newValue ?? false;
                        });
                      },
                      title: Text(
                        item.label,
                        style: AppStyle.labelText,
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      visualDensity: VisualDensity.comfortable,
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
      ),
    );
  }
}
