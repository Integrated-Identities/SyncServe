import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:syncserve/custom_controls/validated_textfield.dart';
import 'package:syncserve/view/service_form.dart';
import 'package:syncserve/view_model/customer_details_view_model.dart';
import 'package:zod_validation/zod_validation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/model/customer_detail_model.dart';

final customerProvider = StateProvider<Customer?>((ref) => null);

class CustomerDetail extends ConsumerStatefulWidget {
  const CustomerDetail({super.key});

  @override
  ConsumerState<CustomerDetail> createState() => _CustomerDetailState();
}

class _CustomerDetailState extends ConsumerState<CustomerDetail> {
  final _formKey = GlobalKey<FormState>();
  CustomerDetailsViewModel viewModel = CustomerDetailsViewModel();

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
          builder: (context) => ServiceForm(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                        label: AppLocalizations.of(context)!.customerName,
                        validator: (value) {
                          if (!viewModel.isNameTouched) return null;
                          if (value == null || value.trim().isEmpty) {
                            return AppLocalizations.of(context)!
                                .customerNameRequired;
                          }
                          return Zod()
                              .required(
                                AppLocalizations.of(context)!
                                    .customerNameRequired,
                              )
                              .min(
                                3,
                                AppLocalizations.of(context)!
                                    .customerNameTooShort,
                              )
                              .build(value);
                        },
                        isRequired: true,
                        onChanged: (_) {
                          if (!viewModel.isNameTouched) {
                            setState(() {
                              viewModel.isNameTouched = true;
                            });
                          }
                        },
                        autovalidateMode: viewModel.isNameTouched
                            ? AutovalidateMode.always
                            : AutovalidateMode.always,
                        decoration: AppStyle.inputDecorationWithLabel(
                          AppLocalizations.of(context)!.customerName,
                        ),
                      ),
                      ValidatedTextField(
                        padding: EdgeInsets.zero,
                        controller: viewModel.addressController,
                        label: AppLocalizations.of(context)!.customerAddress,
                        validator: (value) {
                          if (!viewModel.isAddressTouched) return null;
                          if (value == null || value.trim().isEmpty) {
                            return AppLocalizations.of(context)!
                                .customerAddressRequired;
                          }
                          return Zod()
                              .required(
                                AppLocalizations.of(context)!
                                    .customerAddressRequired,
                              )
                              .min(
                                10,
                                AppLocalizations.of(context)!
                                    .customerAddressTooShort,
                              )
                              .build(value);
                        },
                        maxLines: 2,
                        isRequired: true,
                        onChanged: (_) {
                          if (!viewModel.isAddressTouched) {
                            setState(() {
                              viewModel.isAddressTouched = true;
                            });
                          }
                        },
                        autovalidateMode: viewModel.isAddressTouched
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        decoration: AppStyle.inputDecorationWithLabel(
                          AppLocalizations.of(context)!.customerAddress,
                        ),
                      ),
                      ValidatedTextField(
                        padding: EdgeInsets.zero,
                        controller: viewModel.emailController,
                        label: AppLocalizations.of(context)!.customerEmail,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (!viewModel.isEmailTouched) return null;
                          if (value == null || value.trim().isEmpty) {
                            return AppLocalizations.of(context)!
                                .customerEmailRequired;
                          }
                          return Zod()
                              .required(
                                AppLocalizations.of(context)!
                                    .customerEmailRequired,
                              )
                              .email(
                                AppLocalizations.of(context)!
                                    .customerEmailInvalid,
                              )
                              .min(
                                3,
                                AppLocalizations.of(context)!
                                    .customerEmailTooShort,
                              )
                              .build(value);
                        },
                        isRequired: true,
                        onChanged: (_) {
                          if (!viewModel.isEmailTouched) {
                            setState(() {
                              viewModel.isEmailTouched = true;
                            });
                          }
                        },
                        autovalidateMode: viewModel.isEmailTouched
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        decoration: AppStyle.inputDecorationWithLabel(
                          AppLocalizations.of(context)!.customerEmail,
                        ),
                      ),
                      TextFormField(
                        decoration: AppStyle.inputDecorationWithLabel(
                          AppLocalizations.of(context)!.customerPhone,
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: AppStyle.bottomAreaPadding,
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
