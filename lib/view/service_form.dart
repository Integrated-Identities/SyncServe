import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  ServiceFormViewModel? viewModel;

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
  Widget build(BuildContext context) {
    if (viewModel == null) {
      return const Center(child: CircularProgressIndicator());
    }
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
                                      value: viewModel!.isInstallationSelected,
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel!
                                              .setInstallationSelected(value);
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!
                                          .callBasis,
                                      value: viewModel!.isCallBasisSelected,
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel!
                                              .setCallBasisSelected(value);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              LabeledCheckbox(
                                label: AppLocalizations.of(context)!
                                    .preventiveMaintenance,
                                value:
                                    viewModel!.isPreventiveMaintenanceSelected,
                                onChanged: (value) {
                                  setState(() {
                                    viewModel!.setPreventiveMaintenanceSelected(
                                      value,
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
                                      value: viewModel!.isInWarrantySelected,
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel!
                                              .setInWarrantySelected(value);
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!
                                          .inFreeService,
                                      value: viewModel!.isInFreeServiceSelected,
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel!
                                              .setInFreeServiceSelected(value);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              LabeledCheckbox(
                                label: AppLocalizations.of(context)!
                                    .inAnnualMaintenanceContract,
                                value: viewModel!.isInAnnualSelected,
                                onChanged: (value) {
                                  setState(() {
                                    viewModel!.setInAnnualSelected(value);
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
                                      value: viewModel!.isInUPSSelected,
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel!.setInUPSSelected(value);
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!
                                          .generator,
                                      value: viewModel!.isInGeneratorSelected,
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel!
                                              .setInGeneratorSelected(value);
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
                                      value: viewModel!.isInStabilizerSelected,
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel!
                                              .setInStabilizerSelected(value);
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!
                                          .inverter,
                                      value: viewModel!.isInInverterSelected,
                                      onChanged: (value) {
                                        setState(() {
                                          viewModel!
                                              .setInInverterSelected(value);
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
                              if (!viewModel!.isManufacturerTouched) {
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
                            controller: viewModel!.manufacturerController,
                            autovalidateMode: viewModel!.isManufacturerTouched
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            decoration: AppStyle.inputDecorationWithLabel(
                              AppLocalizations.of(context)!.manufacturerName,
                            ),
                            onChanged: (value) {
                              setState(() {
                                viewModel!.updateManufacturerName(value);
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
                onPressed: viewModel!.isValid
                    ? () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ServiceChecklistView(),
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
