import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/enums/service_checklist.dart';
import 'package:syncserve/utils/flags.dart';
import 'package:syncserve/view/readings_page.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:syncserve/view_model/service_checklist_view_model.dart';
import 'package:syncserve/theme/app_paddings.dart';

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
  final EnumFlags<ServiceChecklistFlag> _flags = EnumFlags();
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
        backgroundColor: AppStyle.appBarNavBarCardAndCanvasColor,
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
                    final isChecked = _flags.contains(item.flag);
                    return CheckboxListTile(
                      value: isChecked,
                      onChanged: (_) {
                        setState(() {
                          isChecked
                              ? _flags.remove(item.flag)
                              : _flags.add(item.flag);
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
              padding: AppPaddings.bottomAreaPadding,
              child: ElevatedButton(
                style: AppStyle.primaryElevatedButtonStyle(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReadingsPage(),
                    ),
                  );
                },
                child: Text(AppLocalizations.of(context)!.next),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
