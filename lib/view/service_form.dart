import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:syncserve/custom_controls/labeled_checkbox.dart';
import 'package:zod_validation/zod_validation.dart';

class ServiceForm extends StatefulWidget {
  const ServiceForm({super.key});

  @override
  State<ServiceForm> createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  final _formKey = GlobalKey<FormState>();
  final _manufacturerController = TextEditingController();
  bool _isFormValid = false;
  bool _isInstallationSelected = false;
  bool _isCallBasisSelected = false;
  bool _isPreventiveMaintenanceSelected = false;
  bool _isInWarrantySelected = false;
  bool _isInFreeServiceSelected = false;
  bool _isInAnnualSelected = false;
  bool _isInUPSSelected = false;
  bool _isInGeneratorSelected = false;
  bool _isInStabilizerSelected = false;
  bool _isInInverterSelected = false;
  bool _isManufacturerTouched = false;

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
        backgroundColor: AppStyle.appBarAndNavBarColor,
        title: Text(AppLocalizations.of(context)!.serviceForm),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 28, 0, 5),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.reason,
                            style: AppStyle.serviceFormLabelText,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        LabeledCheckbox(
                          label: AppLocalizations.of(context)!.installation,
                          padding: AppStyle.serviceFormLabelLeftPadding,
                          value: _isInstallationSelected,
                          onChanged: (bool newValue) {
                            setState(() {
                              _isInstallationSelected = newValue;
                            });
                          },
                          textstyle: AppStyle.labelText,
                        ),
                        LabeledCheckbox(
                          label: AppLocalizations.of(context)!.callBasis,
                          padding: EdgeInsets.only(left: 60),
                          value: _isCallBasisSelected,
                          onChanged: (bool newValue) {
                            setState(() {
                              _isCallBasisSelected = newValue;
                            });
                          },
                          textstyle: AppStyle.labelText,
                        ),
                      ],
                    ),
                    LabeledCheckbox(
                      label:
                          AppLocalizations.of(context)!.preventiveMaintenance,
                      padding: AppStyle.serviceFormLabelLeftPadding,
                      value: _isPreventiveMaintenanceSelected,
                      onChanged: (bool newValue) {
                        setState(() {
                          _isPreventiveMaintenanceSelected = newValue;
                        });
                      },
                      textstyle: AppStyle.labelText,
                    ),
                    SizedBox(
                      height: 40,
                      child: Divider(
                        thickness: 1,
                        color: AppStyle.dividerColor,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: AppStyle.serviceFormLabelPadding,
                          child: Text(
                            AppLocalizations.of(context)!.serviceCategory,
                            style: AppStyle.serviceFormLabelText,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        LabeledCheckbox(
                          textstyle: AppStyle.labelText,
                          label: AppLocalizations.of(context)!.inWarranty,
                          padding: AppStyle.serviceFormLabelLeftPadding,
                          value: _isInWarrantySelected,
                          onChanged: (bool newValue) {
                            setState(() {
                              _isInWarrantySelected = newValue;
                            });
                          },
                        ),
                        LabeledCheckbox(
                          textstyle: AppStyle.labelText,
                          label: AppLocalizations.of(context)!.inFreeService,
                          padding: EdgeInsets.only(left: 60),
                          value: _isInFreeServiceSelected,
                          onChanged: (bool newValue) {
                            setState(() {
                              _isInFreeServiceSelected = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                    LabeledCheckbox(
                      textstyle: AppStyle.labelText,
                      label: AppLocalizations.of(context)!
                          .inAnnualMaintenanceContract,
                      padding: AppStyle.serviceFormLabelLeftPadding,
                      value: _isInAnnualSelected,
                      onChanged: (bool newValue) {
                        setState(() {
                          _isInAnnualSelected = newValue;
                        });
                      },
                    ),
                    SizedBox(
                      height: 40,
                      child: Divider(
                        thickness: 1,
                        color: AppStyle.dividerColor,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: AppStyle.serviceFormLabelPadding,
                          child: Text(
                            AppLocalizations.of(context)!.systemType,
                            style: AppStyle.serviceFormLabelText,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        LabeledCheckbox(
                          label: AppLocalizations.of(context)!.ups,
                          padding: AppStyle.serviceFormLabelLeftPadding,
                          value: _isInUPSSelected,
                          onChanged: (bool newValue) {
                            setState(() {
                              _isInUPSSelected = newValue;
                            });
                          },
                          textstyle: AppStyle.labelText,
                        ),
                        LabeledCheckbox(
                          textstyle: AppStyle.labelText,
                          label: AppLocalizations.of(context)!.generator,
                          padding: EdgeInsets.only(left: 115),
                          value: _isInGeneratorSelected,
                          onChanged: (bool newValue) {
                            setState(() {
                              _isInGeneratorSelected = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        LabeledCheckbox(
                          label: AppLocalizations.of(context)!.stabilizer,
                          padding: AppStyle.serviceFormLabelLeftPadding,
                          value: _isInStabilizerSelected,
                          onChanged: (bool newValue) {
                            setState(() {
                              _isInStabilizerSelected = newValue;
                            });
                          },
                          textstyle: AppStyle.labelText,
                        ),
                        LabeledCheckbox(
                          textstyle: AppStyle.labelText,
                          label: AppLocalizations.of(context)!.inverter,
                          padding: EdgeInsets.only(left: 73),
                          value: _isInInverterSelected,
                          onChanged: (bool newValue) {
                            setState(() {
                              _isInInverterSelected = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                        child: TextFormField(
                          validator: (value) {
                            if (!_isManufacturerTouched) return null;
                            if (value == null || value.trim().isEmpty) {
                              return AppLocalizations.of(context)!
                                  .manufacturerNameRequired;
                            }
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
                          controller: _manufacturerController,
                          autovalidateMode: _isManufacturerTouched
                              ? AutovalidateMode.onUserInteraction
                              : AutovalidateMode.disabled,
                          decoration: AppStyle.inputDecorationWithLabel(
                            AppLocalizations.of(context)!.manufacturerName,
                          ),
                          onChanged: (value) {
                            if (!_isManufacturerTouched) {
                              setState(() {
                                _isManufacturerTouched = true;
                              });
                            }
                            _validateForm();
                          },
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
                onPressed: _isFormValid
                    ? () {
                        if (_formKey.currentState?.validate() ?? false) {}
                      }
                    : null,
                child: Text(AppLocalizations.of(context)!.next),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
