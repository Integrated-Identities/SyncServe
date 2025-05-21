import 'package:flutter/material.dart';
import 'package:syncserve/styles.dart';
import 'package:syncserve/validated_textfield.dart';
import 'package:zod_validation/zod_validation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomerDetail extends StatefulWidget {
  const CustomerDetail({super.key});

  @override
  State<CustomerDetail> createState() => _CustomerDetailState();
}

class _CustomerDetailState extends State<CustomerDetail> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isFormValid = false;

  bool isNameTouched = false;
  bool isAddressTouched = false;
  bool isEmailTouched = false;

  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      _isFormValid = isValid;
    });
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 14),
                      ValidatedTextField(
                        controller: _nameController,
                        label: AppLocalizations.of(context)!.customerName,
                        validator: (value) {
                          if (!isNameTouched) return null;
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
                        label: 'Customer Name',
                        validator: (value) {
                          if (!isNameTouched) return null;
                          if (value == null || value.trim().isEmpty) {
                            return 'Customer name is required';
                          }
                          return Zod()
                              .required('Customer name is required')
                              .min(3, 'Customer name too short')
                              .build(value);
                        },
                        isRequired: true,
                        onChanged: (_) {
                          if (!isNameTouched) {
                            setState(() {
                              isNameTouched = true;
                            });
                          }
                          _validateForm();
                        },
                        autovalidateMode: isNameTouched
                            ? AutovalidateMode.always
                            : AutovalidateMode.always,
                        decoration: AppStyle.inputDecorationWithLabel(
                          AppLocalizations.of(context)!.customerName,
                          'Customer Name',
                        ),
                      ),
                      ValidatedTextField(
                        controller: _addressController,
                        label: AppLocalizations.of(context)!.customerAddress,
                        validator: (value) {
                          if (!isAddressTouched) return null;
                          if (value == null || value.trim().isEmpty) {
                            return AppLocalizations.of(context)!
                                .customerAddress;
                          }
                          return Zod()
                              .required(
                                AppLocalizations.of(context)!
                                    .customerAddressRequired,
                              )
                              .min(
                                3,
                                AppLocalizations.of(context)!
                                    .customerAddressTooShort,
                              )
                        label: 'Address',
                        validator: (value) {
                          if (!isAddressTouched) return null;
                          if (value == null || value.trim().isEmpty) {
                            return 'Address is required';
                          }
                          return Zod()
                              .required('Address is required')
                              .min(3, 'Address too short')
                              .build(value);
                        },
                        maxLines: 2,
                        isRequired: true,
                        onChanged: (_) {
                          if (!isAddressTouched) {
                            setState(() {
                              isAddressTouched = true;
                            });
                          }
                          _validateForm();
                        },
                        autovalidateMode: isAddressTouched
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        decoration: AppStyle.inputDecorationWithLabel(
                          AppLocalizations.of(context)!.customerAddress,
                          'Address',
                        ),
                      ),
                      ValidatedTextField(
                        controller: _emailController,
                        label: AppLocalizations.of(context)!.customerEmail,
                        label: 'Email Id',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (!isEmailTouched) return null;
                          if (value == null || value.trim().isEmpty) {
                            return AppLocalizations.of(context)!.customerEmail;
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
                            return 'Email is required';
                          }
                          return Zod()
                              .required('Email is required')
                              .email('Invalid email')
                              .min(3, 'Too short')
                              .build(value);
                        },
                        isRequired: true,
                        onChanged: (_) {
                          if (!isEmailTouched) {
                            setState(() {
                              isEmailTouched = true;
                            });
                          }
                          _validateForm();
                        },
                        autovalidateMode: isEmailTouched
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        decoration: AppStyle.inputDecorationWithLabel(
                          AppLocalizations.of(context)!.customerEmail,
                          'Email Id',
                        ),
                      ),
                      TextFormField(
                        decoration: AppStyle.inputDecorationWithLabel(
                          AppLocalizations.of(context)!.customerPhone,
                          'Phone Number',
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
              child: ElevatedButton(
                onPressed: _isFormValid
                    ? () {
                        if (_formKey.currentState?.validate() ?? false) {}
                      }
                    : null,
                style: AppStyle.elevatedButtonStyle(),
                child: Text(AppLocalizations.of(context)!.next),
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
