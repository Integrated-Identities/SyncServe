import 'package:flutter/material.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zod_validation/zod_validation.dart';
import 'package:syncserve/custom_controls/validated_textfield.dart';

class ElectricalReadingsPage2 extends StatefulWidget {
  const ElectricalReadingsPage2({super.key});

  @override
  State<ElectricalReadingsPage2> createState() =>
      _ElectricalReadingsPage2State();
}

class _ElectricalReadingsPage2State extends State<ElectricalReadingsPage2> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dcvoltageController = TextEditingController();
  TextEditingController dccurrentController = TextEditingController();
  TextEditingController battvoltageController = TextEditingController();
  TextEditingController battcurrentController = TextEditingController();
  TextEditingController inputneutralController = TextEditingController();
  TextEditingController inputearthController = TextEditingController();
  TextEditingController outputneutralController = TextEditingController();
  TextEditingController outputEarthController = TextEditingController();
  TextEditingController inputFrequencyController = TextEditingController();
  TextEditingController outputFrequencyController = TextEditingController();

  bool isdcVoltagetouched = false;
  bool isdcCurrenttouched = false;
  bool isbattVoltagetouched = false;
  bool isbattCurrenttouched = false;
  bool isInputneutraltouched = false;
  bool isInputearthtouched = false;
  bool isOutputneutraltouched = false;
  bool isOutputearthtouched = false;
  bool isinputFrequencytouched = false;
  bool isoutputFrequencytouched = false;
  bool _isFormValid = false;

  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      _isFormValid = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.appBarNavBarandCardColor,
        title: Text(AppLocalizations.of(context)!.electricalReadings),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // CARD NO.1
                Padding(
                  padding: AppStyle.cardPadding,
                  child: Card(
                    color: AppStyle.appBarNavBarandCardColor,
                    child: Padding(
                      padding: AppStyle.verticalTextfieldPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          // SECTION TITLE-1
                          Padding(
                            padding: AppStyle.sectionTitlePadding,
                            child: Text(
                              AppLocalizations.of(context)!.directCurrent,
                              style: AppStyle.sectionTitleText,
                            ),
                          ),
                          //HORIZONTAL TEXTFIELDS OF TITLE-1 CARD-1
                          Row(
                            spacing: 10,
                            children: [
                              Flexible(
                                child: ValidatedTextField(
                                  controller: dcvoltageController,
                                  label: AppLocalizations.of(context)!.voltage,
                                  validator: (value) {
                                    if (!isdcVoltagetouched) return null;
                                    if (value == null || value.trim().isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .voltageRequired;
                                    }
                                    return Zod()
                                        .required(
                                          AppLocalizations.of(context)!
                                              .voltageRequired,
                                        )
                                        .build(value);
                                  },
                                  isRequired: true,
                                  onChanged: (_) {
                                    if (!isdcVoltagetouched) {
                                      setState(() {
                                        isdcVoltagetouched = true;
                                      });
                                    }
                                    _validateForm();
                                  },
                                  autovalidateMode: isdcVoltagetouched
                                      ? AutovalidateMode.always
                                      : AutovalidateMode.onUserInteraction,
                                  decoration: AppStyle.electricalTextfieldStyle(
                                    AppLocalizations.of(context)!.voltage,
                                    AppLocalizations.of(context)!.v,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: ValidatedTextField(
                                  controller: dccurrentController,
                                  label: AppLocalizations.of(context)!.current,
                                  validator: (value) {
                                    if (!isdcCurrenttouched) return null;
                                    if (value == null || value.trim().isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .currentRequired;
                                    }
                                    return Zod()
                                        .required(
                                          AppLocalizations.of(context)!
                                              .currentRequired,
                                        )
                                        .build(value);
                                  },
                                  isRequired: true,
                                  onChanged: (_) {
                                    if (!isdcCurrenttouched) {
                                      setState(() {
                                        isdcCurrenttouched = true;
                                      });
                                    }
                                    _validateForm();
                                  },
                                  autovalidateMode: isdcCurrenttouched
                                      ? AutovalidateMode.always
                                      : AutovalidateMode.onUserInteraction,
                                  decoration: AppStyle.electricalTextfieldStyle(
                                    AppLocalizations.of(context)!.current,
                                    AppLocalizations.of(context)!.a,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // SECTION TITLE- 2 OF CARD 1
                          Padding(
                            padding: AppStyle.sectionTitlePadding,
                            child: Text(
                              AppLocalizations.of(context)!
                                  .batteryAfterfourtyMins,
                              style: AppStyle.sectionTitleText,
                            ),
                          ),
                          //HORIZONTAL TEXTFIELDS OF TITLE-2 CARD-1
                          Row(
                            spacing: 10,
                            children: [
                              Padding(
                                padding: AppStyle.verticalTextfieldPadding,
                                child: ValidatedTextField(
                                  controller: battvoltageController,
                                  label: AppLocalizations.of(context)!.voltage,
                                  validator: (value) {
                                    if (!isbattVoltagetouched) return null;
                                    if (value == null || value.trim().isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .voltageRequired;
                                    }
                                    return Zod()
                                        .required(
                                          AppLocalizations.of(context)!
                                              .voltageRequired,
                                        )
                                        .build(value);
                                  },
                                  isRequired: true,
                                  onChanged: (_) {
                                    if (!isbattVoltagetouched) {
                                      setState(() {
                                        isbattVoltagetouched = true;
                                      });
                                    }
                                    _validateForm();
                                  },
                                  autovalidateMode: isbattVoltagetouched
                                      ? AutovalidateMode.always
                                      : AutovalidateMode.onUserInteraction,
                                  decoration: AppStyle.electricalTextfieldStyle(
                                    AppLocalizations.of(context)!.voltage,
                                    AppLocalizations.of(context)!.v,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: AppStyle.verticalTextfieldPadding,
                                child: ValidatedTextField(
                                  controller: battcurrentController,
                                  label: AppLocalizations.of(context)!
                                      .currentRequired,
                                  validator: (value) {
                                    if (!isbattCurrenttouched) return null;
                                    if (value == null || value.trim().isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .currentRequired;
                                    }
                                    return Zod()
                                        .required(
                                          AppLocalizations.of(context)!
                                              .currentRequired,
                                        )
                                        .build(value);
                                  },
                                  isRequired: true,
                                  onChanged: (_) {
                                    if (!isbattCurrenttouched) {
                                      setState(() {
                                        isbattCurrenttouched = true;
                                      });
                                    }
                                    _validateForm();
                                  },
                                  autovalidateMode: isbattCurrenttouched
                                      ? AutovalidateMode.always
                                      : AutovalidateMode.onUserInteraction,
                                  decoration: AppStyle.electricalTextfieldStyle(
                                    AppLocalizations.of(context)!.current,
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
                ),
                //CARD NO. 2
                Padding(
                  padding: AppStyle.cardPadding,
                  child: Card(
                    color: AppStyle.appBarNavBarandCardColor,
                    child: Column(
                      children: [
                        // SECTION TITLE-1 OF CARD-2
                        Padding(
                          padding: AppStyle.sectionTitlePadding,
                          child: Text(
                            AppLocalizations.of(context)!.inputVoltage,
                            style: AppStyle.sectionTitleText,
                          ),
                        ),
                        // TEXTFIELDS OF TITLE-1 OF CARD-2
                        Row(
                          spacing: 10,
                          children: [
                            Padding(
                              padding: AppStyle.verticalTextfieldPadding,
                              child: ValidatedTextField(
                                controller: inputneutralController,
                                label: AppLocalizations.of(context)!.neutral,
                                validator: (value) {
                                  if (!isInputneutraltouched) return null;
                                  if (value == null || value.trim().isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .voltageRequired;
                                  }
                                  return Zod()
                                      .required(
                                        AppLocalizations.of(context)!
                                            .voltageRequired,
                                      )
                                      .build(value);
                                },
                                isRequired: true,
                                onChanged: (_) {
                                  if (!isInputneutraltouched) {
                                    setState(() {
                                      isInputneutraltouched = true;
                                    });
                                  }
                                  _validateForm();
                                },
                                autovalidateMode: isInputneutraltouched
                                    ? AutovalidateMode.always
                                    : AutovalidateMode.onUserInteraction,
                                decoration: AppStyle.electricalTextfieldStyle(
                                  AppLocalizations.of(context)!.neutral,
                                  AppLocalizations.of(context)!.v,
                                ),
                              ),
                            ),
                            Padding(
                              padding: AppStyle.verticalTextfieldPadding,
                              child: ValidatedTextField(
                                controller: inputearthController,
                                label: AppLocalizations.of(context)!.earth,
                                validator: (value) {
                                  if (!isInputearthtouched) return null;
                                  if (value == null || value.trim().isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .voltageRequired;
                                  }
                                  return Zod()
                                      .required(
                                        AppLocalizations.of(context)!
                                            .voltageRequired,
                                      )
                                      .build(value);
                                },
                                isRequired: true,
                                onChanged: (_) {
                                  if (!isInputearthtouched) {
                                    setState(() {
                                      isInputearthtouched = true;
                                    });
                                  }
                                  _validateForm();
                                },
                                autovalidateMode: isInputearthtouched
                                    ? AutovalidateMode.always
                                    : AutovalidateMode.onUserInteraction,
                                decoration: AppStyle.electricalTextfieldStyle(
                                  AppLocalizations.of(context)!.earth,
                                  AppLocalizations.of(context)!.v,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // TITLE-2 OF CARD-2
                        Padding(
                          padding: AppStyle.sectionTitlePadding,
                          child: Text(
                            AppLocalizations.of(context)!.frequency,
                            style: AppStyle.sectionTitleText,
                          ),
                        ),
                        Padding(
                          padding: AppStyle.verticalTextfieldPadding,
                          child: ValidatedTextField(
                            controller: inputFrequencyController,
                            label: AppLocalizations.of(context)!.input,
                            validator: (value) {
                              if (!isinputFrequencytouched) return null;
                              if (value == null || value.trim().isEmpty) {
                                return AppLocalizations.of(context)!
                                    .frequencyRequired;
                              }
                              return Zod()
                                  .required(
                                    AppLocalizations.of(context)!
                                        .frequencyRequired,
                                  )
                                  .build(value);
                            },
                            isRequired: true,
                            onChanged: (_) {
                              if (!isinputFrequencytouched) {
                                setState(() {
                                  isinputFrequencytouched = true;
                                });
                              }
                              _validateForm();
                            },
                            autovalidateMode: isinputFrequencytouched
                                ? AutovalidateMode.always
                                : AutovalidateMode.onUserInteraction,
                            decoration: AppStyle.electricalTextfieldStyle(
                              AppLocalizations.of(context)!.input,
                              AppLocalizations.of(context)!.hz,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // CARD NO. 3
                Padding(
                  padding: AppStyle.cardPadding,
                  child: Card(
                    color: AppStyle.appBarNavBarandCardColor,
                    child: Column(
                      children: [
                        // TITLE-1 OF CARD-3
                        Padding(
                          padding: AppStyle.sectionTitlePadding,
                          child: Text(
                            AppLocalizations.of(context)!.outputVoltage,
                            style: AppStyle.sectionTitleText,
                          ),
                        ),
                        // TEXTFIELDS OF TITLE-1 CARD-3
                        Row(
                          spacing: 10,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.44,
                              child: Padding(
                                padding: AppStyle.verticalTextfieldPadding,
                                child: ValidatedTextField(
                                  controller: outputneutralController,
                                  label: AppLocalizations.of(context)!.neutral,
                                  validator: (value) {
                                    if (!isOutputneutraltouched) return null;
                                    if (value == null || value.trim().isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .voltageRequired;
                                    }
                                    return Zod()
                                        .required(
                                          AppLocalizations.of(context)!
                                              .voltageRequired,
                                        )
                                        .build(value);
                                  },
                                  isRequired: true,
                                  onChanged: (_) {
                                    if (!isOutputneutraltouched) {
                                      setState(() {
                                        isOutputneutraltouched = true;
                                      });
                                    }
                                    _validateForm();
                                  },
                                  autovalidateMode: isOutputneutraltouched
                                      ? AutovalidateMode.always
                                      : AutovalidateMode.onUserInteraction,
                                  decoration: AppStyle.electricalTextfieldStyle(
                                    AppLocalizations.of(context)!.neutral,
                                    AppLocalizations.of(context)!.v,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: AppStyle.verticalTextfieldPadding,
                              child: ValidatedTextField(
                                controller: outputEarthController,
                                label: AppLocalizations.of(context)!.earth,
                                validator: (value) {
                                  if (!isOutputearthtouched) return null;
                                  if (value == null || value.trim().isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .voltageRequired;
                                  }
                                  return Zod()
                                      .required(
                                        AppLocalizations.of(context)!
                                            .voltageRequired,
                                      )
                                      .build(value);
                                },
                                isRequired: true,
                                onChanged: (_) {
                                  if (!isOutputearthtouched) {
                                    setState(() {
                                      isOutputearthtouched = true;
                                    });
                                  }
                                  _validateForm();
                                },
                                autovalidateMode: isOutputearthtouched
                                    ? AutovalidateMode.always
                                    : AutovalidateMode.onUserInteraction,
                                decoration: AppStyle.electricalTextfieldStyle(
                                  AppLocalizations.of(context)!.earth,
                                  AppLocalizations.of(context)!.v,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: AppStyle.sectionTitlePadding,
                          child: Text(
                            AppLocalizations.of(context)!.frequency,
                            style: AppStyle.sectionTitleText,
                          ),
                        ),
                        Padding(
                          padding: AppStyle.verticalTextfieldPadding,
                          child: ValidatedTextField(
                            controller: outputFrequencyController,
                            label: AppLocalizations.of(context)!.output,
                            validator: (value) {
                              if (!isoutputFrequencytouched) return null;
                              if (value == null || value.trim().isEmpty) {
                                return AppLocalizations.of(context)!
                                    .frequencyRequired;
                              }
                              return Zod()
                                  .required(
                                    AppLocalizations.of(context)!
                                        .frequencyRequired,
                                  )
                                  .build(value);
                            },
                            isRequired: true,
                            onChanged: (_) {
                              if (!isoutputFrequencytouched) {
                                setState(() {
                                  isoutputFrequencytouched = true;
                                });
                              }
                              _validateForm();
                            },
                            autovalidateMode: isoutputFrequencytouched
                                ? AutovalidateMode.always
                                : AutovalidateMode.onUserInteraction,
                            decoration: AppStyle.electricalTextfieldStyle(
                              AppLocalizations.of(context)!.output,
                              AppLocalizations.of(context)!.hz,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: AppStyle.bottomAreaPadding,
                  child: ElevatedButton(
                    onPressed: _isFormValid
                        ? () {
                            if (_formKey.currentState?.validate() ?? false) {}
                          }
                        : null,
                    style: AppStyle.elevatedButtonStyle(),
                    child: Text(AppLocalizations.of(context)!.next),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
