import 'package:flutter/material.dart';
import 'package:syncserve/view/battery_setup.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zod_validation/zod_validation.dart';
import 'package:syncserve/custom_controls/validated_textfield.dart';
import 'package:syncserve/theme/app_paddings.dart';
import 'package:syncserve/view_model/electrical_readings_view_model.dart';

class SetupInfoPage extends StatefulWidget {
  const SetupInfoPage({super.key});

  @override
  State<SetupInfoPage> createState() => _SetupInfoPageState();
}

class _SetupInfoPageState extends State<SetupInfoPage> {
  final ElectricalReadingsViewModel viewModel = ElectricalReadingsViewModel();
  final _formKey = GlobalKey<FormState>();

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
          builder: (context) => const BatterySetupPage(),
        ),
      );
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
                        // CARD NO.1 - Input Voltage and Current
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
                                    AppLocalizations.of(context)!.inputVoltage,
                                    textAlign: TextAlign.start,
                                    style: AppStyle.titleOnCard,
                                  ),
                                ),
                                // Input Voltage Fields
                                Row(
                                  spacing: 10,
                                  children: [
                                    Expanded(
                                      child: ValidatedTextField(
                                        controller: viewModel.ryController,
                                        label: AppLocalizations.of(context)!
                                            .redYellowShort,
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
                                          AppLocalizations.of(context)!
                                              .redYellowShort,
                                          suffix: AppLocalizations.of(context)!
                                              .voltShort,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ValidatedTextField(
                                        controller: viewModel.ybController,
                                        label: AppLocalizations.of(context)!
                                            .yellowBlueShort,
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
                                          AppLocalizations.of(context)!
                                              .yellowBlueShort,
                                          suffix: AppLocalizations.of(context)!
                                              .voltShort,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ValidatedTextField(
                                  controller: viewModel.brController,
                                  label: AppLocalizations.of(context)!
                                      .blueRedShort,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
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
                                  autovalidateMode: AutovalidateMode.disabled,
                                  decoration: AppStyle.inputDecorationWithLabel(
                                    AppLocalizations.of(context)!.blueRedShort,
                                    suffix:
                                        AppLocalizations.of(context)!.voltShort,
                                  ),
                                ),
                                // SECTION TITLE- 2 OF CARD 1
                                Padding(
                                  padding: AppPaddings.sectionTitlePadding,
                                  child: Text(
                                    AppLocalizations.of(context)!.inputCurrent,
                                    textAlign: TextAlign.start,
                                    style: AppStyle.titleOnCard,
                                  ),
                                ),
                                // Input Current Fields
                                Row(
                                  spacing: 10,
                                  children: [
                                    Expanded(
                                      child: ValidatedTextField(
                                        controller:
                                            viewModel.rCurrentController,
                                        label: AppLocalizations.of(context)!
                                            .rPhaseShort,
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
                                          AppLocalizations.of(context)!
                                              .rPhaseShort,
                                          suffix: AppLocalizations.of(context)!
                                              .amperageShort,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ValidatedTextField(
                                        controller:
                                            viewModel.yCurrentController,
                                        label: AppLocalizations.of(context)!
                                            .yPhaseShort,
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
                                          AppLocalizations.of(context)!
                                              .yPhaseShort,
                                          suffix: AppLocalizations.of(context)!
                                              .amperageShort,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ValidatedTextField(
                                  controller: viewModel.bCurrentController,
                                  label:
                                      AppLocalizations.of(context)!.bPhaseShort,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
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
                                  autovalidateMode: AutovalidateMode.disabled,
                                  decoration: AppStyle.inputDecorationWithLabel(
                                    AppLocalizations.of(context)!.bPhaseShort,
                                    suffix: AppLocalizations.of(context)!
                                        .amperageShort,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // CARD NO. 2 - Output Voltage and Current
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
                                    AppLocalizations.of(context)!.outputVoltage,
                                    textAlign: TextAlign.start,
                                    style: AppStyle.titleOnCard,
                                  ),
                                ),
                                // Output Voltage Fields
                                Row(
                                  spacing: 10,
                                  children: [
                                    Expanded(
                                      child: ValidatedTextField(
                                        controller: viewModel.uvController,
                                        label: AppLocalizations.of(context)!
                                            .uvPhaseShort,
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
                                          AppLocalizations.of(context)!
                                              .uvPhaseShort,
                                          suffix: AppLocalizations.of(context)!
                                              .voltShort,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ValidatedTextField(
                                        controller: viewModel.vwController,
                                        label: AppLocalizations.of(context)!
                                            .vwPhaseShort,
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
                                          AppLocalizations.of(context)!
                                              .vwPhaseShort,
                                          suffix: AppLocalizations.of(context)!
                                              .voltShort,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ValidatedTextField(
                                  controller: viewModel.wuController,
                                  label: AppLocalizations.of(context)!
                                      .wuPhaseShort,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
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
                                  autovalidateMode: AutovalidateMode.disabled,
                                  decoration: AppStyle.inputDecorationWithLabel(
                                    AppLocalizations.of(context)!.wuPhaseShort,
                                    suffix:
                                        AppLocalizations.of(context)!.voltShort,
                                  ),
                                ),
                                // TITLE-2 OF CARD-2
                                Padding(
                                  padding: AppPaddings.sectionTitlePadding,
                                  child: Text(
                                    AppLocalizations.of(context)!.outputCurrent,
                                    textAlign: TextAlign.start,
                                    style: AppStyle.titleOnCard,
                                  ),
                                ),
                                // Output Current Fields
                                Row(
                                  spacing: 10,
                                  children: [
                                    Expanded(
                                      child: ValidatedTextField(
                                        controller:
                                            viewModel.uCurrentController,
                                        label: AppLocalizations.of(context)!
                                            .uPhaseShort,
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
                                          AppLocalizations.of(context)!
                                              .uPhaseShort,
                                          suffix: AppLocalizations.of(context)!
                                              .amperageShort,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ValidatedTextField(
                                        controller:
                                            viewModel.vCurrentController,
                                        label: AppLocalizations.of(context)!
                                            .voltShort,
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
                                          AppLocalizations.of(context)!
                                              .voltShort,
                                          suffix: AppLocalizations.of(context)!
                                              .amperageShort,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ValidatedTextField(
                                  controller: viewModel.wCurrentController,
                                  label:
                                      AppLocalizations.of(context)!.wPhaseShort,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
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
                                  autovalidateMode: AutovalidateMode.disabled,
                                  decoration: AppStyle.inputDecorationWithLabel(
                                    AppLocalizations.of(context)!.wPhaseShort,
                                    suffix: AppLocalizations.of(context)!
                                        .amperageShort,
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
