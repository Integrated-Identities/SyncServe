import 'package:flutter/material.dart';
import 'package:syncserve/styles.dart';
import 'package:syncserve/validated_textfield.dart';
import 'package:zod_validation/zod_validation.dart';

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
                          'Customer Name',
                        ),
                      ),
                      ValidatedTextField(
                        controller: _addressController,
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
                          'Address',
                        ),
                      ),
                      ValidatedTextField(
                        controller: _emailController,
                        label: 'Email Id',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (!isEmailTouched) return null;
                          if (value == null || value.trim().isEmpty) {
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
                          'Email Id',
                        ),
                      ),
                      TextFormField(
                        decoration: AppStyle.inputDecorationWithLabel(
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
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
