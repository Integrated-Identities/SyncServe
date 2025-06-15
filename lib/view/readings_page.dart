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
                      SizedBox(
                        height: 448,
                        child: Card(
                          color: AppStyle.appBarAndNavBarColor,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: TextFormField(
                                          decoration:
                                              AppStyle.inputDecorationWithLabel(
                                            AppLocalizations.of(context)!.kva,
                                            AppLocalizations.of(context)!.power,
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
                                            AppLocalizations.of(context)!.dcv,
                                            AppLocalizations.of(context)!
                                                .dcVoltage,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            style: AppStyle.labelText,
                                            AppLocalizations.of(context)!
                                                .batteryType,
                                          ),
                                          DropdownButtonFormField(
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
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: TextFormField(
                                          decoration:
                                              AppStyle.inputDecorationWithLabel(
                                            AppLocalizations.of(context)!.ah,
                                            AppLocalizations.of(context)!
                                                .energyCurrent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                QuantitySelector(
                                  initialValue: 1,
                                  onChanged: (value) {
                                    print('New quantity: $value');
                                  },
                                  minValue: 0,
                                  maxValue: 100,
                                ),
                                TextFormField(
                                  decoration: AppStyle.inputDecorationWithLabel(
                                    '',
                                    AppLocalizations.of(context)!
                                        .manufacturerName,
                                  ),
                                ),
                                LabeledCheckbox(
                                  label: AppLocalizations.of(context)!
                                      .withStabilizer,
                                  value: viewModel.withStabilizer,
                                  onChanged: (value) {
                                    setState(() {
                                      viewModel.withStabilizer = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          color: AppStyle.appBarAndNavBarColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      AppStyle.segmentedButtonWithLabelPadding,
                                  child: Text(
                                    style: AppStyle.labelText,
                                    AppLocalizations.of(context)!.inputPhase,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    AppStyle.segmentedButtonWithLabelPadding,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: SegmentedButton<PhaseType>(
                                    segments: <ButtonSegment<PhaseType>>[
                                      ButtonSegment<PhaseType>(
                                        value: PhaseType.onePhase,
                                        label: Text(
                                          AppLocalizations.of(context)!
                                              .onePhase,
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
                                        viewModel.inputPhase =
                                            newSelection.first;
                                      });
                                    },
                                    style: AppStyle.segmentedButtonStyle(),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      AppStyle.segmentedButtonWithLabelPadding,
                                  child: Text(
                                    style: AppStyle.labelText,
                                    AppLocalizations.of(context)!.outputPhase,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    AppStyle.segmentedButtonWithLabelPadding,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: SegmentedButton<PhaseType>(
                                    segments: <ButtonSegment<PhaseType>>[
                                      ButtonSegment<PhaseType>(
                                        value: PhaseType.onePhase,
                                        label: Text(
                                          AppLocalizations.of(context)!
                                              .onePhase,
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
                                        viewModel.outputPhase =
                                            newSelection.last;
                                      });
                                    },
                                    style: AppStyle.segmentedButtonStyle(),
                                  ),
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
