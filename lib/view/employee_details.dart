import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/custom_controls/validated_textfield.dart';
import 'package:syncserve/theme/app_paddings.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:syncserve/view/dashboard.dart';
import 'package:zod_validation/zod_validation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/view_model/employee_details_view_model.dart';

class EmployeeDetails extends ConsumerStatefulWidget {
  const EmployeeDetails({super.key});

  @override
  ConsumerState<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends ConsumerState<EmployeeDetails> {
  EmployeeDetailsViewModel viewModel = EmployeeDetailsViewModel();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    bool isValid = _formKey.currentState?.validate() ?? false;

    if (isValid) {
      viewModel.save(ref);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.employeeDetails,
        ),
        centerTitle: true,
        backgroundColor: AppStyle.appBarNavBarCardAndCanvasColor,
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
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    spacing: 5,
                    children: [
                      ValidatedTextField(
                        padding: EdgeInsets.zero,
                        controller: viewModel.nameController,
                        label: AppLocalizations.of(context)!.employeeName,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppLocalizations.of(context)!
                                .employeeNameRequired;
                          }
                          return Zod()
                              .required(
                                AppLocalizations.of(context)!
                                    .employeeNameRequired,
                              )
                              .build(value);
                        },
                        isRequired: true,
                        decoration: AppStyle.inputDecorationWithLabel(
                          AppLocalizations.of(context)!.employeeName,
                        ),
                      ),
                      ValidatedTextField(
                        padding: EdgeInsets.zero,
                        controller: viewModel.addressController,
                        label: AppLocalizations.of(context)!.employeeAddress,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppLocalizations.of(context)!
                                .employeeAddressRequired;
                          }
                          return Zod()
                              .required(
                                AppLocalizations.of(context)!
                                    .employeeAddressRequired,
                              )
                              .build(value);
                        },
                        maxLines: 2,
                        isRequired: true,
                        decoration: AppStyle.inputDecorationWithLabel(
                          AppLocalizations.of(context)!.employeeAddress,
                        ),
                      ),
                      ValidatedTextField(
                        padding: EdgeInsets.zero,
                        controller: viewModel.emailController,
                        label: AppLocalizations.of(context)!.employeeEmail,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppLocalizations.of(context)!
                                .employeeEmailRequired;
                          }
                          return Zod()
                              .required(
                                AppLocalizations.of(context)!
                                    .employeeEmailRequired,
                              )
                              .email(
                                AppLocalizations.of(context)!
                                    .employeeEmailInvalid,
                              )
                              .build(value);
                        },
                        isRequired: true,
                        decoration: AppStyle.inputDecorationWithLabel(
                          AppLocalizations.of(context)!.employeeEmail,
                        ),
                      ),
                      TextFormField(
                        decoration: AppStyle.inputDecorationWithLabel(
                          AppLocalizations.of(context)!.employeePhone,
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: AppPaddings.bottomAreaPadding,
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
