import 'package:flutter/material.dart';
import 'package:syncserve/custom_controls/labeled_checkbox.dart';
import 'package:syncserve/custom_controls/quantity_selector.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/view_model/readings_page_view_model.dart';

class ReadingsPage extends StatefulWidget {
  const ReadingsPage({super.key});

  @override
  State<ReadingsPage> createState() => _ReadingsPageState();
}

class _ReadingsPageState extends State<ReadingsPage> {
  final ReadingsViewModel viewModel = ReadingsViewModel();
  late List<String> category;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    category = [
      AppLocalizations.of(context)!.smf,
      AppLocalizations.of(context)!.tub,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppStyle.appBarAndNavBarColor,
        title: Text(
          AppLocalizations.of(context)!.readingsPage,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Card(
                        color: AppStyle.appBarAndNavBarColor,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: TextFormField(
                                        decoration:
                                            AppStyle.inputDecorationWithLabel(
                                          AppLocalizations.of(context)!.power,
                                          suffix:
                                              AppLocalizations.of(context)!.kva,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: TextFormField(
                                        decoration:
                                            AppStyle.inputDecorationWithLabel(
                                          AppLocalizations.of(context)!
                                              .dcVoltage,
                                          suffix:
                                              AppLocalizations.of(context)!.dcv,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: DropdownButtonFormField(
                                      value: category.first,
                                      decoration:
                                          AppStyle.inputDecorationWithLabel(
                                        AppLocalizations.of(context)!
                                            .batteryType,
                                      ),
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                      ),
                                      items: category.map((e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        print(value);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: TextFormField(
                                        decoration:
                                            AppStyle.inputDecorationWithLabel(
                                          AppLocalizations.of(context)!
                                              .energyCurrent,
                                          suffix:
                                              AppLocalizations.of(context)!.ah,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .stretch, // This stretches children to match height
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration:
                                            AppStyle.inputDecorationWithLabel(
                                          AppLocalizations.of(context)!
                                              .manufacturerName,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Center(
                                        child: LabeledCheckbox(
                                          label: AppLocalizations.of(context)!
                                              .withStabilizer,
                                          value: viewModel.withStabilizer,
                                          onChanged: (value) {
                                            setState(() {
                                              viewModel.withStabilizer = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      right: 5,
                                      left: 10,
                                    ),
                                    child: Text(
                                      AppLocalizations.of(context)!.quantity,
                                      style: AppStyle.labelText,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: QuantitySelector(
                                      initialValue: 1,
                                      onChanged: (value) {
                                        print('New quantity: $value');
                                      },
                                      minValue: 0,
                                      maxValue: 100,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        color: AppStyle.appBarAndNavBarColor,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  style: AppStyle.labelText,
                                  AppLocalizations.of(context)!.inputPhase,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: SegmentedButton<PhaseType>(
                                  segments: <ButtonSegment<PhaseType>>[
                                    ButtonSegment<PhaseType>(
                                      value: PhaseType.onePhase,
                                      label: Text(
                                        AppLocalizations.of(context)!.onePhase,
                                      ),
                                    ),
                                    ButtonSegment<PhaseType>(
                                      value: PhaseType.threePhase,
                                      label: Text(
                                        AppLocalizations.of(context)!
                                            .threePhase,
                                      ),
                                    ),
                                  ],
                                  selected: <PhaseType>{viewModel.inputPhase},
                                  onSelectionChanged:
                                      (Set<PhaseType> newSelection) {
                                    setState(() {
                                      viewModel.inputPhase = newSelection.first;
                                    });
                                  },
                                  style: AppStyle.segmentedButtonStyle(),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  style: AppStyle.labelText,
                                  AppLocalizations.of(context)!.outputPhase,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: SegmentedButton<PhaseType>(
                                  segments: <ButtonSegment<PhaseType>>[
                                    ButtonSegment<PhaseType>(
                                      value: PhaseType.onePhase,
                                      label: Text(
                                        AppLocalizations.of(context)!.onePhase,
                                      ),
                                    ),
                                    ButtonSegment<PhaseType>(
                                      value: PhaseType.threePhase,
                                      label: Text(
                                        AppLocalizations.of(context)!
                                            .threePhase,
                                      ),
                                    ),
                                  ],
                                  selected: <PhaseType>{
                                    viewModel.outputPhase,
                                  },
                                  onSelectionChanged:
                                      (Set<PhaseType> newSelection) {
                                    setState(() {
                                      viewModel.outputPhase = newSelection.last;
                                    });
                                  },
                                  style: AppStyle.segmentedButtonStyle(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: AppStyle.bottomAreaPadding,
              child: ElevatedButton(
                style: AppStyle.primaryElevatedButtonStyle(),
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
