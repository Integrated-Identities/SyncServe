import 'package:flutter/material.dart';
import 'package:syncserve/dashboard.dart';
import 'package:syncserve/styles.dart';
import 'package:zod_validation/zod_validation.dart';

class CustomerDetail extends StatefulWidget {
  const CustomerDetail({super.key});

  @override
  State<CustomerDetail> createState() => _CustomerDetailState();
}

class _CustomerDetailState extends State<CustomerDetail> {
  final _formKey = GlobalKey<FormState>();
  bool isFormValid = false;

  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      isFormValid = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Container(
              color: Colors.blue,
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 5, 8),
                    child: TextFormField(
                      validator: Zod()
                          .required('Customer name is required')
                          .min(3, 'Invalid name')
                          .build,
                      onChanged: (_) => _validateForm(),
                      cursorColor: Colors.black,
                      decoration: AppStyle.inputDecorationWithLabel(
                        'Customer Name',
                        isRequired: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 5, 8),
                    child: TextFormField(
                      validator: Zod()
                          .required('Address is required')
                          .min(3, 'Address too Short')
                          .build,
                      onChanged: (_) => _validateForm(),
                      textAlignVertical: TextAlignVertical.top,
                      maxLines: 2,
                      cursorColor: Colors.black,
                      decoration: AppStyle.inputDecorationWithLabel(
                        'Address',
                        isRequired: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 5, 8),
                    child: TextFormField(
                      validator: Zod()
                          .required('Email is required')
                          .email('Invalid Email')
                          .min(3, 'Too short')
                          .build,
                      onChanged: (_) => _validateForm(),
                      cursorColor: Colors.black,
                      decoration: AppStyle.inputDecorationWithLabel(
                        'Email Id',
                        isRequired: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 5, 0),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      decoration: AppStyle.inputDecorationWithLabel(
                        'Phone Number',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: isFormValid
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Dashboard(),
                                  ),
                                );
                              }
                            : null,
                        style: AppStyle.elevatedButtonStyle(
                          isEnabled: isFormValid,
                        ),
                        child: const Text(
                          'Next',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
