import 'package:flutter/material.dart';
import 'package:syncserve/electrical_readings_page_2.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zod_validation/zod_validation.dart';
import 'package:syncserve/custom_controls/validated_textfield.dart';

class ElectricalPage extends StatefulWidget {
  const ElectricalPage({super.key});

  @override
  State<ElectricalPage> createState() => _ElectricalPageState();
}

class _ElectricalPageState extends State<ElectricalPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController ryController = TextEditingController();
  TextEditingController ybController = TextEditingController();
  TextEditingController brController = TextEditingController();
  TextEditingController rController = TextEditingController();
  TextEditingController yController = TextEditingController();
  TextEditingController bController = TextEditingController();
  TextEditingController uvController = TextEditingController();
  TextEditingController vwController = TextEditingController();
  TextEditingController wuController = TextEditingController();
  TextEditingController uController = TextEditingController();
  TextEditingController vController = TextEditingController();
  TextEditingController wController = TextEditingController();

  bool isRYtouched = false;
  bool isYBtouched = false;
  bool isBRtouched = false;
  bool isRtouched = false;
  bool isYtouched = false;
  bool isBtouched = false;
  bool isUVtouched = false;
  bool isVWtouched = false;
  bool isWUtouched = false;
  bool isUtouched = false;
  bool isVtouched = false;
  bool isWtouched = false;
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
        title: Text(
          AppLocalizations.of(context)!.electricalReadings,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: AppStyle.cardPadding,
                // CARD NO. 1
                child: Card(
                  color: AppStyle.appBarNavBarandCardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SECTION TITLE-1 CARD-1
                      Padding(
                        padding: AppStyle.sectionTitlePadding,
                        child: Text(
                          style: AppStyle.sectionTitleText,
                          AppLocalizations.of(context)!.inputVoltage,
                        ),
                      ),
                      // TEXTFIELD-1
                      Row(
                        children: [
                          Padding(
                            padding: AppStyle.textfieldPadding,
                            child: ValidatedTextField(
                              controller: ryController,
                              label: AppLocalizations.of(context)!.ry,
                              validator: (value) {
                                if (!isRYtouched) return null;
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
                                if (!isRYtouched) {
                                  setState(() {
                                    isRYtouched = true;
                                  });
                                }
                                _validateForm();
                              },
                              autovalidateMode: isRYtouched
                                  ? AutovalidateMode.always
                                  : AutovalidateMode.onUserInteraction,
                              decoration: AppStyle.electricalTextfieldStyle(
                                AppLocalizations.of(context)!.ry,
                                AppLocalizations.of(context)!.v,
                              ),
                            ),
                          ),
                          // TEXTFIELD-2
                          Padding(
                            padding: AppStyle.textfieldPadding,
                            child: ValidatedTextField(
                              controller: ybController,
                              label: AppLocalizations.of(context)!.yb,
                              validator: (value) {
                                if (!isYBtouched) return null;
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
                                if (!isYBtouched) {
                                  setState(() {
                                    isYBtouched = true;
                                  });
                                }
                                _validateForm();
                              },
                              autovalidateMode: isYBtouched
                                  ? AutovalidateMode.always
                                  : AutovalidateMode.onUserInteraction,
                              decoration: AppStyle.electricalTextfieldStyle(
                                AppLocalizations.of(context)!.yb,
                                AppLocalizations.of(context)!.v,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // TEXTFIELD-3
                      Padding(
                        padding: AppStyle.textfieldPadding,
                        child: ValidatedTextField(
                          controller: brController,
                          label: AppLocalizations.of(context)!.br,
                          validator: (value) {
                            if (!isBRtouched) return null;
                            if (value == null || value.trim().isEmpty) {
                              return AppLocalizations.of(context)!
                                  .voltageRequired;
                            }
                            return Zod()
                                .required(
                                  AppLocalizations.of(context)!.voltageRequired,
                                )
                                .build(value);
                          },
                          isRequired: true,
                          onChanged: (_) {
                            if (!isBRtouched) {
                              setState(() {
                                isBRtouched = true;
                              });
                            }
                            _validateForm();
                          },
                          autovalidateMode: isBRtouched
                              ? AutovalidateMode.always
                              : AutovalidateMode.onUserInteraction,
                          decoration: AppStyle.electricalTextfieldStyle(
                            AppLocalizations.of(context)!.br,
                            AppLocalizations.of(context)!.v,
                          ),
                        ),
                      ),
                      // SECTION TITLE-2 CARD-1
                      Padding(
                        padding: AppStyle.sectionTitlePadding,
                        child: Text(
                          style: AppStyle.sectionTitleText,
                          AppLocalizations.of(context)!.inputCurrent,
                        ),
                      ),
                      Row(
                        children: [
                          // TEXTFIELD-1 CARD-1 SECTION-2
                          Padding(
                            padding: AppStyle.textfieldPadding,
                            child: TextFormField(
                              decoration: AppStyle.electricalTextfieldStyle(
                                AppLocalizations.of(context)!.r,
                                AppLocalizations.of(context)!.a,
                              ),
                            ),
                          ),
                          // TEXTFIELD-2 CARD-1 SECTION-2
                          Padding(
                            padding: AppStyle.textfieldPadding,
                            child: TextFormField(
                              decoration: AppStyle.electricalTextfieldStyle(
                                AppLocalizations.of(context)!.y,
                                AppLocalizations.of(context)!.a,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // TEXTFIELD-3 CARD-1 SECTION-2
                      Padding(
                        padding: AppStyle.textfieldPadding,
                        child: TextFormField(
                          decoration: AppStyle.electricalTextfieldStyle(
                            AppLocalizations.of(context)!.b,
                            AppLocalizations.of(context)!.a,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // CARD NO. 2
              Padding(
                padding: AppStyle.cardPadding,
                child: Card(
                  color: AppStyle.appBarNavBarandCardColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: AppStyle.sectionTitlePadding,
                        child: Text(
                          style: AppStyle.sectionTitleText,
                          AppLocalizations.of(context)!.outputVoltage,
                        ),
                      ),
                      Row(
                        children: [
                          // TEXTFIELD-1 CARD-2 SECTION-1
                          Padding(
                            padding: AppStyle.textfieldPadding,
                            child: TextFormField(
                              decoration: AppStyle.electricalTextfieldStyle(
                                AppLocalizations.of(context)!.uv,
                                AppLocalizations.of(context)!.v,
                              ),
                            ),
                          ),
                          // TEXTFIELD-2 CARD-2 SECTION-
                          Padding(
                            padding: AppStyle.textfieldPadding,
                            child: TextFormField(
                              decoration: AppStyle.electricalTextfieldStyle(
                                AppLocalizations.of(context)!.vw,
                                AppLocalizations.of(context)!.v,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // TEXTFIELD-3 CARD-2 SECTION-1
                      Padding(
                        padding: AppStyle.textfieldPadding,
                        child: TextFormField(
                          decoration: AppStyle.electricalTextfieldStyle(
                            AppLocalizations.of(context)!.wu,
                            AppLocalizations.of(context)!.v,
                          ),
                        ),
                      ),
                      // SECTION TITLE-2
                      Padding(
                        padding: AppStyle.sectionTitlePadding,
                        child: Text(
                          style: AppStyle.sectionTitleText,
                          AppLocalizations.of(context)!.outputCurrent,
                        ),
                      ),

                      // TEXTFIELD-1 CARD-2 SECTION-2
                      Row(
                        children: [
                          Padding(
                            padding: AppStyle.textfieldPadding,
                            child: TextFormField(
                              decoration: AppStyle.electricalTextfieldStyle(
                                AppLocalizations.of(context)!.u,
                                AppLocalizations.of(context)!.a,
                              ),
                            ),
                          ),
                          // TEXTFIELD-2 CARD-2 SECTION-2
                          Padding(
                            padding: AppStyle.textfieldPadding,
                            child: TextFormField(
                              decoration: AppStyle.electricalTextfieldStyle(
                                AppLocalizations.of(context)!.v,
                                AppLocalizations.of(context)!.a,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: AppStyle.textfieldPadding,
                        child: TextFormField(
                          decoration: AppStyle.electricalTextfieldStyle(
                            AppLocalizations.of(context)!.w,
                            AppLocalizations.of(context)!.a,
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
                  style: AppStyle.elevatedButtonStyle(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ElectricalReadingsPage2(),
                      ),
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.next),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
