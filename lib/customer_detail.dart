import 'package:flutter/material.dart';
import 'package:syncserve/styles.dart';
import 'package:zod_validation/zod_validation.dart';
import 'package:syncserve/validated_textfield.dart';

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
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
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
                      Validatedtextfield(
                        controller: _nameController,
                        label: 'Customer Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Customer name is required';
                          }
                          return Zod()
                              .required('Customer name is required')
                              .min(3, 'Customer name too short')
                              .build(value);
                        },
                        isRequired: true,
                      ),
                      Validatedtextfield(
                        controller: _addressController,
                        label: 'Address',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Address is required';
                          }
                          return Zod()
                              .required('Address is required')
                              .min(3, 'Address too short')
                              .build(value);
                        },
                        maxLines: 2,
                        isRequired: true,
                      ),
                      Validatedtextfield(
                        controller: _emailController,
                        label: 'Email Id',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          return Zod()
                              .required('Email is required')
                              .email('Invalid email')
                              .min(3, 'Too short')
                              .build(value);
                        },
                        isRequired: true,
                      ),
                      Validatedtextfield(
                        validator: (p0) {
                          return null;
                        },
                        controller: _phoneController,
                        label: 'Phone Number',
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
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {}
                },
                style: AppStyle.elevatedButtonStyle().copyWith(
                  minimumSize: WidgetStatePropertyAll(
                    Size(MediaQuery.of(context).size.width, 70),
                  ),
                ),
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
