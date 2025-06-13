import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/model/service_form_model.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:syncserve/custom_controls/labeled_checkbox.dart';
import 'package:syncserve/view/service_checklist.dart';
import 'package:zod_validation/zod_validation.dart';
import 'package:syncserve/view_model/service_form_view_model.dart';

class ServiceForm extends StatefulWidget {
  const ServiceForm({super.key});

  @override
  State<ServiceForm> createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  final _formKey = GlobalKey<FormState>();
  ServiceFormViewModel viewModel = ServiceFormViewModel();
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Initialize after the widget is fully mounted
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        viewModel = ServiceFormViewModel();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: AppStyle.sectionTitlePadding,
                          child: Text(
                            AppLocalizations.of(context)!.reasonForVisit,
                            style: AppStyle.sectionTitleText,
                          ),
                        ),
                        Padding(
                          padding: AppStyle.sectionContentPadding,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!
                                          .installation,
                                      value: viewModel.isSelected(
                                        ServiceReasons.installation,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.toggleReason(
                                            ServiceReasons.installation,
                                          );
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!
                                          .callBasis,
                                      value: viewModel
                                          .isSelected(ServiceReasons.callBasis),
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.toggleReason(
                                            ServiceReasons.callBasis,
                                          );
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              LabeledCheckbox(
                                label: AppLocalizations.of(context)!
                                    .preventiveMaintenance,
                                value: viewModel.isSelected(
                                  ServiceReasons.preventiveMaintenance,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    viewModel.toggleReason(
                                      ServiceReasons.preventiveMaintenance,
                                    );
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Divider(
                            thickness: 1,
                            color: AppStyle.dividerColor,
                          ),
                        ),
                        Padding(
                          padding: AppStyle.sectionTitlePadding,
                          child: Text(
                            AppLocalizations.of(context)!.serviceCategory,
                            style: AppStyle.sectionTitleText,
                          ),
                        ),
                        Padding(
                          padding: AppStyle.sectionContentPadding,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!
                                          .inWarranty,
                                      value: viewModel.isSelectedCategory(
                                        ServiceCategory.inWarranty,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.toggleCategory(
                                            ServiceCategory.inWarranty,
                                          );
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!
                                          .inFreeService,
                                      value: viewModel.isSelectedCategory(
                                        ServiceCategory.inFreeService,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.toggleCategory(
                                            ServiceCategory.inFreeService,
                                          );
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              LabeledCheckbox(
                                label: AppLocalizations.of(context)!
                                    .inAnnualMaintenanceContract,
                                value: viewModel.isSelectedCategory(
                                  ServiceCategory.inAnnualMaintenanceContract,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    viewModel.toggleCategory(
                                      ServiceCategory
                                          .inAnnualMaintenanceContract,
                                    );
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Divider(
                            thickness: 1,
                            color: AppStyle.dividerColor,
                          ),
                        ),
                        Padding(
                          padding: AppStyle.sectionTitlePadding,
                          child: Text(
                            AppLocalizations.of(context)!.systemType,
                            style: AppStyle.sectionTitleText,
                          ),
                        ),
                        Padding(
                          padding: AppStyle.sectionContentPadding,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!.ups,
                                      value: viewModel.isSelectedSystemType(
                                        ServiceSystemType.ups,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.toggleSystemType(
                                            ServiceSystemType.ups,
                                          );
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!
                                          .generator,
                                      value: viewModel.isSelectedSystemType(
                                        ServiceSystemType.generator,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.toggleSystemType(
                                            ServiceSystemType.generator,
                                          );
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!
                                          .stabilizer,
                                      value: viewModel.isSelectedSystemType(
                                        ServiceSystemType.stabilizer,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.toggleSystemType(
                                            ServiceSystemType.stabilizer,
                                          );
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!
                                          .inverter,
                                      value: viewModel.isSelectedSystemType(
                                        ServiceSystemType.inverter,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel.toggleSystemType(
                                            ServiceSystemType.inverter,
                                          );
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                          child: TextFormField(
                            validator: (value) {
                              if (!viewModel.isManufacturerTouched) {
                                return null;
                              }
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
                            controller: controller,
                            autovalidateMode: viewModel.isManufacturerTouched
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            decoration: AppStyle.inputDecorationWithLabel(
                              AppLocalizations.of(context)!.manufacturerName,
                            ),
                            onChanged: (value) {
                              setState(() {
                                viewModel.manufacturerName = value;
                                viewModel.isManufacturerTouched = true;
                                _formKey.currentState?.validate();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: AppStyle.bottomAreaPadding,
              child: ElevatedButton(
                style: AppStyle.elevatedButtonStyle(),
                onPressed: viewModel.isValid
                    ? () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ServiceChecklist(),
                            ),
                          );
                        }
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
