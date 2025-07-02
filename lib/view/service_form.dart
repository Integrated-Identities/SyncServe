import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/enums/service_form.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:syncserve/custom_controls/labeled_checkbox.dart';
import 'package:syncserve/view/service_checklist.dart';
import 'package:zod_validation/zod_validation.dart';
import 'package:syncserve/view_model/service_form_view_model.dart';
import 'package:syncserve/theme/app_paddings.dart';

class ServiceForm extends ConsumerStatefulWidget {
  const ServiceForm({super.key});

  @override
  ConsumerState<ServiceForm> createState() => _ServiceFormState();
}

class _ServiceFormState extends ConsumerState<ServiceForm> {
  final _formKey = GlobalKey<FormState>();
  ServiceFormViewModel viewModel = ServiceFormViewModel();
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
    super.dispose();
  }

  void _onNextPressed() {
    bool isValid = _formKey.currentState?.validate() ?? false;

    if (isValid) {
      viewModel.save(ref);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ServiceChecklist(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.appBarNavBarCardAndCanvasColor,
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
                          padding: AppPaddings.sectionTitlePadding,
                          child: Text(
                            AppLocalizations.of(context)!.reasonForVisit,
                            style: AppStyle.sectionTitleText,
                          ),
                        ),
                        Padding(
                          padding: AppPaddings.sectionContentPadding,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!
                                          .installation,
                                      value: viewModel.reasons.contains(
                                        ServiceReasons.installation,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          value
                                              ? viewModel.reasons.add(
                                                  ServiceReasons.installation,
                                                )
                                              : viewModel.reasons.remove(
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
                                      value: viewModel.reasons
                                          .contains(ServiceReasons.callBasis),
                                      onChanged: (value) {
                                        setState(() {
                                          value
                                              ? viewModel.reasons.add(
                                                  ServiceReasons.callBasis,
                                                )
                                              : viewModel.reasons.remove(
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
                                value: viewModel.reasons.contains(
                                  ServiceReasons.preventiveMaintenance,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    value
                                        ? viewModel.reasons.add(
                                            ServiceReasons
                                                .preventiveMaintenance,
                                          )
                                        : viewModel.reasons.remove(
                                            ServiceReasons
                                                .preventiveMaintenance,
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
                          padding: AppPaddings.sectionTitlePadding,
                          child: Text(
                            AppLocalizations.of(context)!.serviceCategory,
                            style: AppStyle.sectionTitleText,
                          ),
                        ),
                        Padding(
                          padding: AppPaddings.sectionContentPadding,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!
                                          .inWarranty,
                                      value: viewModel.category.contains(
                                        ServiceCategory.inWarranty,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          value
                                              ? viewModel.category.add(
                                                  ServiceCategory.inWarranty,
                                                )
                                              : viewModel.category.remove(
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
                                      value: viewModel.category.contains(
                                        ServiceCategory.inFreeService,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          value
                                              ? viewModel.category.add(
                                                  ServiceCategory.inFreeService,
                                                )
                                              : viewModel.category.remove(
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
                                value: viewModel.category.contains(
                                  ServiceCategory.inAnnualMaintenanceContract,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    value
                                        ? viewModel.category.add(
                                            ServiceCategory
                                                .inAnnualMaintenanceContract,
                                          )
                                        : viewModel.category.remove(
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
                          padding: AppPaddings.sectionTitlePadding,
                          child: Text(
                            AppLocalizations.of(context)!.systemType,
                            style: AppStyle.sectionTitleText,
                          ),
                        ),
                        Padding(
                          padding: AppPaddings.sectionContentPadding,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!.ups,
                                      value: viewModel.systemType.contains(
                                        ServiceSystemType.ups,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          value
                                              ? viewModel.systemType.add(
                                                  ServiceSystemType.ups,
                                                )
                                              : viewModel.systemType.remove(
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
                                      value: viewModel.systemType.contains(
                                        ServiceSystemType.generator,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          value
                                              ? viewModel.systemType.add(
                                                  ServiceSystemType.generator,
                                                )
                                              : viewModel.systemType.remove(
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
                                      value: viewModel.systemType.contains(
                                        ServiceSystemType.stabilizer,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          value
                                              ? viewModel.systemType.add(
                                                  ServiceSystemType.stabilizer,
                                                )
                                              : viewModel.systemType.remove(
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
                                      value: viewModel.systemType.contains(
                                        ServiceSystemType.inverter,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          value
                                              ? viewModel.systemType.add(
                                                  ServiceSystemType.inverter,
                                                )
                                              : viewModel.systemType.remove(
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
                              if (value == null || value.trim().isEmpty) {
                                return AppLocalizations.of(context)!
                                    .manufacturerNameRequired;
                              }
                              return Zod()
                                  .required(
                                    AppLocalizations.of(context)!
                                        .manufacturerNameRequired,
                                  )
                                  .build(value);
                            },
                            decoration: AppStyle.inputDecorationWithLabel(
                              AppLocalizations.of(context)!.manufacturerName,
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
