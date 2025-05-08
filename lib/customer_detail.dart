import 'package:flutter/material.dart';
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

  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();

  bool isNameTouched = false;
  bool isAddressTouched = false;
  bool isEmailTouched = false;

  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      isFormValid = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  controller: _nameController,
                  onTap: () {
                    setState(() {
                      isNameTouched = true;
                    });
                  },
                  onChanged: (_) {
                    setState(() {
                      _validateForm();
                    });
                  },
                  validator: (value) {
                    if (!isNameTouched) return null;
                    if (value == null || value.isEmpty) {
                      return 'Customer name is required';
                    }
                    return Zod()
                        .required('Customer name is required')
                        .min(3, 'Customer name too Short')
                        .build(value);
                  },
                  cursorColor: Colors.black,
                  decoration: AppStyle.inputDecorationWithLabel(
                    'Customer Name',
                    isRequired: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  controller: _addressController,
                  onTap: () {
                    setState(() {
                      isAddressTouched = true;
                    });
                  },
                  onChanged: (_) {
                    setState(() {
                      _validateForm();
                    });
                  },
                  validator: (value) {
                    if (!isAddressTouched) return null;
                    if (value == null || value.isEmpty) {
                      return 'Address is required';
                    }
                    return Zod()
                        .required('Address is required')
                        .min(3, 'Address too short')
                        .build(value);
                  },
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
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  controller: _emailController,
                  onTap: () {
                    setState(() {
                      isEmailTouched = true;
                    });
                  },
                  onChanged: (_) {
                    setState(() {
                      _validateForm();
                    });
                  },
                  validator: (value) {
                    if (!isEmailTouched) return null;
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return Zod()
                        .required('Email is required')
                        .email('Invalid email')
                        .min(3, 'Too short')
                        .build(value);
                  },
                  cursorColor: Colors.black,
                  decoration: AppStyle.inputDecorationWithLabel(
                    'Email Id',
                    isRequired: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: AppStyle.inputDecorationWithLabel(
                    'Phone Number',
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                child: SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: isFormValid ? () {} : null,
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
    );
  }
}
