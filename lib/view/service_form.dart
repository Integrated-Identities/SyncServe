import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:syncserve/custom_controls/labeled_checkbox.dart';
import 'package:syncserve/view/service_checklist_view.dart';
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 28, 0, 5),
                        child: Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.reasonForVisit,
                              style: AppStyle.serviceFormLabelText,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          LabeledCheckbox(
                            label: AppLocalizations.of(context)!.installation,
                            padding: AppStyle.serviceFormLabelPadding,
                            value: viewModel!.isInstallationSelected,
                            onChanged: viewModel!.setInstallationSelected,
                            textStyle: AppStyle.serviceFormText,
                          ),
                          LabeledCheckbox(
                            label: AppLocalizations.of(context)!.callBasis,
                            padding: EdgeInsets.only(left: 60),
                            value: viewModel!.isCallBasisSelected,
                            onChanged: viewModel!.setCallBasisSelected,
                            textStyle: AppStyle.serviceFormText,
                          ),
                        ],
                      ),
                      LabeledCheckbox(
                        label:
                            AppLocalizations.of(context)!.preventiveMaintenance,
                        padding: AppStyle.serviceFormLabelPadding,
                        value: viewModel!.isPreventiveMaintenanceSelected,
                        onChanged: viewModel!.setPreventiveMaintenanceSelected,
                        textStyle: AppStyle.serviceFormText,
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
                            textStyle: AppStyle.serviceFormText,
                            label: AppLocalizations.of(context)!.inWarranty,
                            padding: AppStyle.serviceFormLabelPadding,
                            value: viewModel!.isInWarrantySelected,
                            onChanged: viewModel!.setInWarrantySelected,
                          ),
                          LabeledCheckbox(
                            textStyle: AppStyle.serviceFormText,
                            label: AppLocalizations.of(context)!.inFreeService,
                            padding: EdgeInsets.only(left: 60),
                            value: viewModel!.isInFreeServiceSelected,
                            onChanged: viewModel!.setInFreeServiceSelected,
                          ),
                        ],
                      ),
                      LabeledCheckbox(
                        textStyle: AppStyle.serviceFormText,
                        label: AppLocalizations.of(context)!
                            .inAnnualMaintenanceContract,
                        padding: AppStyle.serviceFormLabelPadding,
                        value: viewModel!.isInAnnualSelected,
                        onChanged: viewModel!.setInAnnualSelected,
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
                            padding: AppStyle.serviceFormLabelPadding,
                            value: viewModel!.isInUPSSelected,
                            onChanged: viewModel!.setInUPSSelected,
                            textStyle: AppStyle.serviceFormText,
                          ),
                          LabeledCheckbox(
                            textStyle: AppStyle.serviceFormText,
                            label: AppLocalizations.of(context)!.generator,
                            padding: EdgeInsets.only(left: 115),
                            value: viewModel!.isInGeneratorSelected,
                            onChanged: viewModel!.setInGeneratorSelected,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          LabeledCheckbox(
                            label: AppLocalizations.of(context)!.stabilizer,
                            padding: AppStyle.serviceFormLabelPadding,
                            value: viewModel!.isInStabilizerSelected,
                            onChanged: viewModel!.setInStabilizerSelected,
                            textStyle: AppStyle.serviceFormText,
                          ),
                          LabeledCheckbox(
                            textStyle: AppStyle.serviceFormText,
                            label: AppLocalizations.of(context)!.inverter,
                            padding: EdgeInsets.only(left: 73),
                            value: viewModel!.isInInverterSelected,
                            onChanged: viewModel!.setInInverterSelected,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                        child: TextFormField(
                          validator: (value) {
                            if (!viewModel!.isManufacturerTouched) return null;
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
                          onChanged: viewModel!.updateManufacturerName,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: AppStyle.bottomAreaPadding,
              child: ElevatedButton(
                style: AppStyle.elevatedButtonStyle(),
                onPressed: viewModel!.isFormValid
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
