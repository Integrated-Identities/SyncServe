import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/enums/service_form.dart';
import 'package:syncserve/providers/service_form_providers.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:syncserve/custom_controls/labeled_checkbox.dart';
import 'package:syncserve/view/service_checklist.dart';
import 'package:zod_validation/zod_validation.dart';
import 'package:syncserve/view_model/service_form_view_model.dart';
import 'package:syncserve/helpers/service_form_helper.dart';
import 'package:syncserve/theme/app_paddings.dart';

class ServiceForm extends ConsumerStatefulWidget {
  const ServiceForm({super.key});

  @override
  ConsumerState<ServiceForm> createState() => _ServiceFormState();
}

class _ServiceFormState extends ConsumerState<ServiceForm> {
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

  void _onNextPressed() {
    bool isValid = _formKey.currentState?.validate() ?? false;

    if (isValid) {
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
    final selectedReasons = ref.watch(visitReasonProvider);
    final selectedCategories = ref.watch(serviceCategoryProvider);
    final selectedSystems = ref.watch(systemTypeProvider);
    final manufacturerName = ref.watch(manufacturerNameProvider);
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
                                      value: selectedReasons.contains(
                                        ServiceReasons.installation,
                                      ),
                                      onChanged: (value) {
                                        toggleItem<ServiceReasons>(
                                          ref,
                                          visitReasonProvider,
                                          ServiceReasons.installation,
                                          value,
                                        );
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!
                                          .callBasis,
                                      value: selectedReasons.contains(
                                        ServiceReasons.callBasis,
                                      ),
                                      onChanged: (value) {
                                        toggleItem<ServiceReasons>(
                                          ref,
                                          visitReasonProvider,
                                          ServiceReasons.callBasis,
                                          value,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              LabeledCheckbox(
                                label: AppLocalizations.of(context)!
                                    .preventiveMaintenance,
                                value: selectedReasons.contains(
                                  ServiceReasons.preventiveMaintenance,
                                ),
                                onChanged: (value) {
                                  toggleItem<ServiceReasons>(
                                    ref,
                                    visitReasonProvider,
                                    ServiceReasons.preventiveMaintenance,
                                    value,
                                  );
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
                                      value: selectedCategories.contains(
                                        ServiceCategory.inWarranty,
                                      ),
                                      onChanged: (value) {
                                        toggleItem<ServiceCategory>(
                                          ref,
                                          serviceCategoryProvider,
                                          ServiceCategory.inWarranty,
                                          value,
                                        );
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!
                                          .inFreeService,
                                      value: selectedCategories.contains(
                                        ServiceCategory.inFreeService,
                                      ),
                                      onChanged: (value) {
                                        toggleItem<ServiceCategory>(
                                          ref,
                                          serviceCategoryProvider,
                                          ServiceCategory.inFreeService,
                                          value,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              LabeledCheckbox(
                                label: AppLocalizations.of(context)!
                                    .inAnnualMaintenanceContract,
                                value: selectedCategories.contains(
                                  ServiceCategory.inAnnualMaintenanceContract,
                                ),
                                onChanged: (value) {
                                  toggleItem<ServiceCategory>(
                                    ref,
                                    serviceCategoryProvider,
                                    ServiceCategory.inAnnualMaintenanceContract,
                                    value,
                                  );
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
                                      value: selectedSystems.contains(
                                        ServiceSystemType.ups,
                                      ),
                                      onChanged: (value) {
                                        toggleItem<ServiceSystemType>(
                                          ref,
                                          systemTypeProvider,
                                          ServiceSystemType.ups,
                                          value,
                                        );
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!
                                          .generator,
                                      value: selectedSystems.contains(
                                        ServiceSystemType.generator,
                                      ),
                                      onChanged: (value) {
                                        toggleItem<ServiceSystemType>(
                                          ref,
                                          systemTypeProvider,
                                          ServiceSystemType.generator,
                                          value,
                                        );
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
                                      value: selectedSystems.contains(
                                        ServiceSystemType.stabilizer,
                                      ),
                                      onChanged: (value) {
                                        toggleItem<ServiceSystemType>(
                                          ref,
                                          systemTypeProvider,
                                          ServiceSystemType.stabilizer,
                                          value,
                                        );
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: LabeledCheckbox(
                                      label: AppLocalizations.of(context)!
                                          .inverter,
                                      value: selectedSystems.contains(
                                        ServiceSystemType.inverter,
                                      ),
                                      onChanged: (value) {
                                        toggleItem<ServiceSystemType>(
                                          ref,
                                          systemTypeProvider,
                                          ServiceSystemType.inverter,
                                          value,
                                        );
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
                            initialValue: manufacturerName,
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
                            onChanged: (value) {
                              ref
                                  .read(manufacturerNameProvider.notifier)
                                  .state = value;
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
