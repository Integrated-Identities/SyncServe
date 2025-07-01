import 'package:flutter/material.dart';
import 'package:syncserve/custom_controls/labeled_checkbox.dart';
import 'package:syncserve/custom_controls/quantity_selector.dart';
import 'package:syncserve/custom_controls/validated_textfield.dart';
import 'package:syncserve/view/customer_approval.dart';
import 'package:syncserve/enums/battery_type.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/view_model/readings_page_view_model.dart';
import 'package:zod_validation/zod_validation.dart';
import 'package:syncserve/theme/app_paddings.dart';

class ReadingsPage extends StatefulWidget {
  const ReadingsPage({super.key});

  @override
  State<ReadingsPage> createState() => _ReadingsPageState();
}

class _ReadingsPageState extends State<ReadingsPage> {
  final ReadingsViewModel viewModel = ReadingsViewModel();
  final _formKey = GlobalKey<FormState>();
  late List<String> category;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    bool isValid = _formKey.currentState?.validate() ?? false;

    if (isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomerApproval(),
        ),
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    category = BatteryType.values.map((e) => e.name).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppStyle.appBarNavBarCardAndCanvasColor,
        title: Text(
          AppLocalizations.of(context)!.readingsPage,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        _PowerConfigurationCard(
                          viewModel: viewModel,
                          category: category,
                          onStabilizerChanged: (value) {
                            setState(() {
                              viewModel.withStabilizer = value;
                            });
                          },
                        ),
                        SizedBox(height: 15),
                        _PhaseSelectionCard(
                          viewModel: viewModel,
                          onInputPhaseChanged: (newPhase) {
                            setState(() {
                              viewModel.inputPhase = newPhase;
                            });
                          },
                          onOutputPhaseChanged: (newPhase) {
                            setState(() {
                              viewModel.outputPhase = newPhase;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: AppPaddings.bottomAreaPadding,
              child: ElevatedButton(
                style: AppStyle.primaryElevatedButtonStyle(),
                onPressed: _onNextPressed,
                child: Text(AppLocalizations.of(context)!.next),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PowerConfigurationCard extends StatelessWidget {
  const _PowerConfigurationCard({
    required this.viewModel,
    required this.category,
    required this.onStabilizerChanged,
  });
  final ReadingsViewModel viewModel;
  final List<String> category;
  final ValueChanged<bool> onStabilizerChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppStyle.appBarNavBarCardAndCanvasColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ValidatedTextField(
                      autovalidateMode: AutovalidateMode.disabled,
                      controller: viewModel.powerController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      label: AppLocalizations.of(context)!.power,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppLocalizations.of(context)!.powerRequired;
                        }
                        if (!RegExp(r'^\d*\.?\d*$').hasMatch(value)) {
                          return AppLocalizations.of(context)!.invalidNumber;
                        }
                        return Zod()
                            .required(
                              AppLocalizations.of(context)!.powerRequired,
                            )
                            .build(value);
                      },
                      isRequired: true,
                      decoration: AppStyle.inputDecorationWithLabel(
                        AppLocalizations.of(context)!.power,
                        suffix: AppLocalizations.of(context)!.kva,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ValidatedTextField(
                      autovalidateMode: AutovalidateMode.disabled,
                      controller: viewModel.dcVoltageController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      label: AppLocalizations.of(context)!.dcVoltage,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppLocalizations.of(context)!
                              .dcVoltageRequired;
                        }
                        if (!RegExp(r'^\d*\.?\d*$').hasMatch(value)) {
                          return AppLocalizations.of(context)!.invalidNumber;
                        }
                        return Zod()
                            .required(
                              AppLocalizations.of(context)!.dcVoltageRequired,
                            )
                            .build(value);
                      },
                      isRequired: true,
                      decoration: AppStyle.inputDecorationWithLabel(
                        AppLocalizations.of(context)!.dcVoltage,
                        suffix: AppLocalizations.of(context)!.dcv,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: DropdownButtonFormField<BatteryType>(
                    value: viewModel.batteryType,
                    decoration: AppStyle.inputDecorationWithLabel(
                      AppLocalizations.of(context)!.batteryType,
                    ),
                    icon: const Icon(Icons.arrow_drop_down),
                    items: BatteryType.values.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value == null) return;

                      viewModel.batteryType = value;
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ValidatedTextField(
                      autovalidateMode: AutovalidateMode.disabled,
                      controller: viewModel.energyController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      label: AppLocalizations.of(context)!.energy,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppLocalizations.of(context)!.energyRequired;
                        }
                        if (!RegExp(r'^\d*\.?\d*$').hasMatch(value)) {
                          return AppLocalizations.of(context)!.invalidNumber;
                        }
                        return Zod()
                            .required(
                              AppLocalizations.of(context)!.energyRequired,
                            )
                            .build(value);
                      },
                      isRequired: true,
                      decoration: AppStyle.inputDecorationWithLabel(
                        AppLocalizations.of(context)!.energy,
                        suffix: AppLocalizations.of(context)!.ah,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ValidatedTextField(
                      autovalidateMode: AutovalidateMode.disabled,
                      controller: viewModel.manufacturerNameController,
                      label: AppLocalizations.of(context)!.manufacturerName,
                      validator: (value) {
                        return Zod()
                            .required(
                              AppLocalizations.of(context)!
                                  .manufacturerNameRequired,
                            )
                            .min(
                              3,
                              AppLocalizations.of(context)!
                                  .manufacturerNameTooShort,
                            )
                            .build(value);
                      },
                      isRequired: true,
                      decoration: AppStyle.inputDecorationWithLabel(
                        AppLocalizations.of(context)!.manufacturerName,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: LabeledCheckbox(
                        label: AppLocalizations.of(context)!.withStabilizer,
                        value: viewModel.withStabilizer,
                        onChanged: onStabilizerChanged,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 5, left: 10),
                  child: Text(
                    AppLocalizations.of(context)!.quantity,
                    style: AppStyle.labelText,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: QuantitySelector(
                    initialValue: viewModel.quantity,
                    onChanged: (value) {
                      viewModel.updateQuantity(value);
                    },
                    minValue: 1,
                    maxValue: 100,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PhaseSelectionCard extends StatelessWidget {
  const _PhaseSelectionCard({
    required this.viewModel,
    required this.onInputPhaseChanged,
    required this.onOutputPhaseChanged,
  });
  final ReadingsViewModel viewModel;
  final ValueChanged<PhaseType> onInputPhaseChanged;
  final ValueChanged<PhaseType> onOutputPhaseChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppStyle.appBarNavBarCardAndCanvasColor,
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
                    label: Text(AppLocalizations.of(context)!.onePhase),
                  ),
                  ButtonSegment<PhaseType>(
                    value: PhaseType.threePhase,
                    label: Text(AppLocalizations.of(context)!.threePhase),
                  ),
                ],
                selected: <PhaseType>{viewModel.inputPhase},
                onSelectionChanged: (Set<PhaseType> newSelection) {
                  onInputPhaseChanged(newSelection.first);
                },
                style: AppStyle.segmentedButtonStyle(),
              ),
            ),
            SizedBox(height: 15),
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
                    label: Text(AppLocalizations.of(context)!.onePhase),
                  ),
                  ButtonSegment<PhaseType>(
                    value: PhaseType.threePhase,
                    label: Text(AppLocalizations.of(context)!.threePhase),
                  ),
                ],
                selected: <PhaseType>{viewModel.outputPhase},
                onSelectionChanged: (Set<PhaseType> newSelection) {
                  onOutputPhaseChanged(newSelection.first);
                },
                style: AppStyle.segmentedButtonStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
