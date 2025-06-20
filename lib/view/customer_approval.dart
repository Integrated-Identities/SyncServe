import 'package:flutter/material.dart';
import 'package:syncserve/custom_controls/validated_textfield.dart';
import 'package:syncserve/singature_capture_screen.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/view/login.dart';
import 'package:zod_validation/zod_validation.dart';
import 'dart:typed_data';
import 'package:syncserve/view_model/customer_approval_view_model.dart';

class CustomerApproval extends StatefulWidget {
  const CustomerApproval({super.key});

  @override
  State<CustomerApproval> createState() => _CustomerApprovalState();
}

class _CustomerApprovalState extends State<CustomerApproval> {
  Uint8List? _signatureImage;
  CustomerApprovalViewModel viewModel = CustomerApprovalViewModel();

  @override
  void initState() {
    super.initState();
  }

  void _onNextPressed() {
    bool isValid = _formKey.currentState?.validate() ?? false;

    if (isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppStyle.appBarAndNavBarColor,
        title: Text(
          AppLocalizations.of(context)!.customerApprovalPage,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: AppStyle.sectionContentPadding2,
                    child: Column(
                      children: [
                        ValidatedTextField(
                          controller: viewModel.customerNameController,
                          label: AppLocalizations.of(context)!.customerName,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return AppLocalizations.of(context)!
                                  .customerNameRequired;
                            }
                            return Zod()
                                .required(
                                  AppLocalizations.of(context)!
                                      .customerNameRequired,
                                )
                                .build(value);
                          },
                          isRequired: true,
                          decoration: AppStyle.inputDecorationWithLabel(
                            AppLocalizations.of(context)!.customerName,
                          ),
                        ),
                        ValidatedTextField(
                          controller: viewModel.phoneNumberController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          label: AppLocalizations.of(context)!.customerPhone,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return AppLocalizations.of(context)!
                                  .customerPhoneRequired;
                            }
                            return Zod()
                                .required(
                                  AppLocalizations.of(context)!
                                      .customerPhoneRequired,
                                )
                                .build(value);
                          },
                          isRequired: true,
                          decoration: AppStyle.inputDecorationWithLabel(
                            AppLocalizations.of(context)!.customerPhone,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final Uint8List? image = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SingatureCaptureScreen(),
                              ),
                            );
                            if (image != null) {
                              setState(() {
                                _signatureImage = image;
                              });
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              color: Colors.white,
                            ),
                            child: _signatureImage != null
                                ? Image.memory(_signatureImage!)
                                : Center(
                                    child: Text(
                                      AppLocalizations.of(context)!.tapToSign,
                                      style: AppStyle.headingText,
                                    ),
                                  ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 40),
                          child: Row(
                            children: [
                              Checkbox(
                                value: viewModel.isChecked,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    viewModel.isChecked = newValue!;
                                  });
                                },
                              ),
                              Flexible(
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .certificationCheckbox,
                                  style: AppStyle.labelText,
                                  softWrap: true,
                                ),
                              ),
                            ],
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
