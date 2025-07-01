import 'package:flutter/material.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/theme/app_paddings.dart';
import 'package:zod_validation/zod_validation.dart';
import 'package:syncserve/custom_controls/validated_textfield.dart';
import 'package:syncserve/view_model/battery_setup_view_model.dart';

class BatterySetupPage extends StatefulWidget {
  const BatterySetupPage({super.key});

  @override
  State<BatterySetupPage> createState() => _BatterySetupPageState();
}

class _BatterySetupPageState extends State<BatterySetupPage> {
  final BatterySetupViewModel viewModel = BatterySetupViewModel();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    bool isValid = _formKey.currentState?.validate() ?? false;

    if (isValid) {
      // Navigate to next page or perform action
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.appBarNavBarCardAndCanvasColor,
        title: Text(AppLocalizations.of(context)!.electricalReadings),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: AppPaddings.pagePadding,
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // CARD NO.1
                        Card(
                          color: AppStyle.appBarNavBarCardAndCanvasColor,
                          child: Padding(
                            padding: AppPaddings.cardPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SECTION TITLE-1
                                Padding(
                                  padding: AppPaddings.sectionTitlePadding,
                                  child: Text(
                                    AppLocalizations.of(context)!.directCurrent,
                                    textAlign: TextAlign.start,
                                    style: AppStyle.titleOnCard,
                                  ),
                                ),
                                //HORIZONTAL TEXTFIELDS OF TITLE-1 CARD-1
                                Row(
                                  spacing: 10,
                                  children: [
                                    Expanded(
                                      child: ValidatedTextField(
                                        controller:
                                            viewModel.dcVoltageController,
                                        label: AppLocalizations.of(context)!
                                            .voltage,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return AppLocalizations.of(context)!
                                                .voltageRequired;
                                          }
                                          if (!RegExp(r'^\d*\.?\d*$')
                                              .hasMatch(value)) {
                                            return AppLocalizations.of(context)!
                                                .invalidNumber;
                                          }
                                          return Zod()
                                              .required(
                                                AppLocalizations.of(context)!
                                                    .voltageRequired,
                                              )
                                              .build(value);
                                        },
                                        isRequired: true,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        decoration:
                                            AppStyle.inputDecorationWithLabel(
                                          AppLocalizations.of(context)!.voltage,
                                          suffix:
                                              AppLocalizations.of(context)!.v,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ValidatedTextField(
                                        controller:
                                            viewModel.dcCurrentController,
                                        label: AppLocalizations.of(context)!
                                            .current,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return AppLocalizations.of(context)!
                                                .currentRequired;
                                          }
                                          if (!RegExp(r'^\d*\.?\d*$')
                                              .hasMatch(value)) {
                                            return AppLocalizations.of(context)!
                                                .invalidNumber;
                                          }
                                          return Zod()
                                              .required(
                                                AppLocalizations.of(context)!
                                                    .currentRequired,
                                              )
                                              .build(value);
                                        },
                                        isRequired: true,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        decoration:
                                            AppStyle.inputDecorationWithLabel(
                                          AppLocalizations.of(context)!.current,
                                          suffix:
                                              AppLocalizations.of(context)!.a,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // SECTION TITLE- 2 OF CARD 1
                                Padding(
                                  padding: AppPaddings.sectionTitlePadding,
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .batteryAfterFortyMins,
                                    textAlign: TextAlign.start,
                                    style: AppStyle.titleOnCard,
                                  ),
                                ),
                                //HORIZONTAL TEXTFIELDS OF TITLE-2 CARD-1
                                Row(
                                  spacing: 10,
                                  children: [
                                    Expanded(
                                      child: ValidatedTextField(
                                        controller:
                                            viewModel.battVoltageController,
                                        label: AppLocalizations.of(context)!
                                            .voltage,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return AppLocalizations.of(context)!
                                                .voltageRequired;
                                          }
                                          if (!RegExp(r'^\d*\.?\d*$')
                                              .hasMatch(value)) {
                                            return AppLocalizations.of(context)!
                                                .invalidNumber;
                                          }
                                          return Zod()
                                              .required(
                                                AppLocalizations.of(context)!
                                                    .voltageRequired,
                                              )
                                              .build(value);
                                        },
                                        isRequired: true,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        decoration:
                                            AppStyle.inputDecorationWithLabel(
                                          AppLocalizations.of(context)!.voltage,
                                          suffix:
                                              AppLocalizations.of(context)!.v,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ValidatedTextField(
                                        controller:
                                            viewModel.battCurrentController,
                                        label: AppLocalizations.of(context)!
                                            .current,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return AppLocalizations.of(context)!
                                                .currentRequired;
                                          }
                                          if (!RegExp(r'^\d*\.?\d*$')
                                              .hasMatch(value)) {
                                            return AppLocalizations.of(context)!
                                                .invalidNumber;
                                          }
                                          return Zod()
                                              .required(
                                                AppLocalizations.of(context)!
                                                    .currentRequired,
                                              )
                                              .build(value);
                                        },
                                        isRequired: true,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        decoration:
                                            AppStyle.inputDecorationWithLabel(
                                          AppLocalizations.of(context)!.current,
                                          suffix:
                                              AppLocalizations.of(context)!.a,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //CARD NO. 2
                        Card(
                          color: AppStyle.appBarNavBarCardAndCanvasColor,
                          child: Padding(
                            padding: AppPaddings.cardPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SECTION TITLE-1 OF CARD-2
                                Padding(
                                  padding: AppPaddings.sectionTitlePadding,
                                  child: Text(
                                    AppLocalizations.of(context)!.inputVoltage,
                                    textAlign: TextAlign.start,
                                    style: AppStyle.titleOnCard,
                                  ),
                                ),
                                // TEXTFIELDS OF TITLE-1 OF CARD-2
                                Row(
                                  spacing: 10,
                                  children: [
                                    Expanded(
                                      child: ValidatedTextField(
                                        controller:
                                            viewModel.inputNeutralController,
                                        label: AppLocalizations.of(context)!
                                            .neutral,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return AppLocalizations.of(context)!
                                                .voltageRequired;
                                          }
                                          if (!RegExp(r'^\d*\.?\d*$')
                                              .hasMatch(value)) {
                                            return AppLocalizations.of(context)!
                                                .invalidNumber;
                                          }
                                          return Zod()
                                              .required(
                                                AppLocalizations.of(context)!
                                                    .voltageRequired,
                                              )
                                              .build(value);
                                        },
                                        isRequired: true,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        decoration:
                                            AppStyle.inputDecorationWithLabel(
                                          AppLocalizations.of(context)!.neutral,
                                          suffix:
                                              AppLocalizations.of(context)!.v,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ValidatedTextField(
                                        controller:
                                            viewModel.inputEarthController,
                                        label:
                                            AppLocalizations.of(context)!.earth,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return AppLocalizations.of(context)!
                                                .voltageRequired;
                                          }
                                          if (!RegExp(r'^\d*\.?\d*$')
                                              .hasMatch(value)) {
                                            return AppLocalizations.of(context)!
                                                .invalidNumber;
                                          }
                                          return Zod()
                                              .required(
                                                AppLocalizations.of(context)!
                                                    .voltageRequired,
                                              )
                                              .build(value);
                                        },
                                        isRequired: true,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        decoration:
                                            AppStyle.inputDecorationWithLabel(
                                          AppLocalizations.of(context)!.earth,
                                          suffix:
                                              AppLocalizations.of(context)!.v,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // TITLE-2 OF CARD-2
                                Padding(
                                  padding: AppPaddings.sectionTitlePadding,
                                  child: Text(
                                    AppLocalizations.of(context)!.frequency,
                                    textAlign: TextAlign.start,
                                    style: AppStyle.titleOnCard,
                                  ),
                                ),
                                ValidatedTextField(
                                  controller:
                                      viewModel.inputFrequencyController,
                                  label: AppLocalizations.of(context)!.input,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .frequencyRequired;
                                    }
                                    if (!RegExp(r'^\d*\.?\d*$')
                                        .hasMatch(value)) {
                                      return AppLocalizations.of(context)!
                                          .invalidNumber;
                                    }
                                    return Zod()
                                        .required(
                                          AppLocalizations.of(context)!
                                              .frequencyRequired,
                                        )
                                        .build(value);
                                  },
                                  isRequired: true,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  decoration: AppStyle.inputDecorationWithLabel(
                                    AppLocalizations.of(context)!.input,
                                    suffix: AppLocalizations.of(context)!.hz,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // CARD NO. 3
                        Card(
                          color: AppStyle.appBarNavBarCardAndCanvasColor,
                          child: Padding(
                            padding: AppPaddings.cardPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // TITLE-1 OF CARD-3
                                Padding(
                                  padding: AppPaddings.sectionTitlePadding,
                                  child: Text(
                                    AppLocalizations.of(context)!.outputVoltage,
                                    textAlign: TextAlign.start,
                                    style: AppStyle.titleOnCard,
                                  ),
                                ),
                                Row(
                                  spacing: 10,
                                  children: [
                                    Expanded(
                                      child: ValidatedTextField(
                                        controller:
                                            viewModel.outputNeutralController,
                                        label: AppLocalizations.of(context)!
                                            .neutral,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return AppLocalizations.of(context)!
                                                .voltageRequired;
                                          }
                                          if (!RegExp(r'^\d*\.?\d*$')
                                              .hasMatch(value)) {
                                            return AppLocalizations.of(context)!
                                                .invalidNumber;
                                          }
                                          return Zod()
                                              .required(
                                                AppLocalizations.of(context)!
                                                    .voltageRequired,
                                              )
                                              .build(value);
                                        },
                                        isRequired: true,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        decoration:
                                            AppStyle.inputDecorationWithLabel(
                                          AppLocalizations.of(context)!.neutral,
                                          suffix:
                                              AppLocalizations.of(context)!.v,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ValidatedTextField(
                                        controller:
                                            viewModel.outputEarthController,
                                        label:
                                            AppLocalizations.of(context)!.earth,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return AppLocalizations.of(context)!
                                                .voltageRequired;
                                          }
                                          if (!RegExp(r'^\d*\.?\d*$')
                                              .hasMatch(value)) {
                                            return AppLocalizations.of(context)!
                                                .invalidNumber;
                                          }
                                          return Zod()
                                              .required(
                                                AppLocalizations.of(context)!
                                                    .voltageRequired,
                                              )
                                              .build(value);
                                        },
                                        isRequired: true,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        decoration:
                                            AppStyle.inputDecorationWithLabel(
                                          AppLocalizations.of(context)!.earth,
                                          suffix:
                                              AppLocalizations.of(context)!.v,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: AppPaddings.sectionTitlePadding,
                                  child: Text(
                                    AppLocalizations.of(context)!.frequency,
                                    textAlign: TextAlign.start,
                                    style: AppStyle.titleOnCard,
                                  ),
                                ),
                                ValidatedTextField(
                                  controller:
                                      viewModel.outputFrequencyController,
                                  label: AppLocalizations.of(context)!.output,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .frequencyRequired;
                                    }
                                    if (!RegExp(r'^\d*\.?\d*$')
                                        .hasMatch(value)) {
                                      return AppLocalizations.of(context)!
                                          .invalidNumber;
                                    }
                                    return Zod()
                                        .required(
                                          AppLocalizations.of(context)!
                                              .frequencyRequired,
                                        )
                                        .build(value);
                                  },
                                  isRequired: true,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  decoration: AppStyle.inputDecorationWithLabel(
                                    AppLocalizations.of(context)!.output,
                                    suffix: AppLocalizations.of(context)!.hz,
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
            ),
            Padding(
              padding: AppPaddings.pagePadding,
              child: ElevatedButton(
                onPressed: _onNextPressed,
                style: AppStyle.primaryElevatedButtonStyle(),
                child: Text(AppLocalizations.of(context)!.next),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
