import 'package:flutter/material.dart';
import 'package:syncserve/custom_controls/validated_textfield.dart';
import 'package:syncserve/view/singature_capture_screen.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/view/login.dart';
import 'package:zod_validation/zod_validation.dart';
import 'dart:typed_data';
import 'package:syncserve/view_model/customer_approval_view_model.dart';
import 'package:syncserve/theme/app_paddings.dart';

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

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    bool isValid = _formKey.currentState?.validate() ?? false;

    if (!viewModel.isCertified) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.snackbarMessage),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

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
        backgroundColor: AppStyle.appBarNavBarCardAndCanvasColor,
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
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: Column(
                    children: [
                      ValidatedTextField(
                        padding: EdgeInsets.only(bottom: 10),
                        autovalidateMode: AutovalidateMode.disabled,
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
                              .min(
                                3,
                                AppLocalizations.of(context)!
                                    .customerNameTooShort,
                              )
                              .build(value);
                        },
                        isRequired: true,
                        decoration: AppStyle.inputDecorationWithLabel(
                          AppLocalizations.of(context)!.customerName,
                        ),
                      ),
                      ValidatedTextField(
                        padding: EdgeInsets.only(bottom: 10),
                        autovalidateMode: AutovalidateMode.disabled,
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
                            border: Border.all(),
                            color: AppStyle.appBarNavBarCardAndCanvasColor,
                          ),
                          child: _signatureImage != null
                              ? RotatedBox(
                                  quarterTurns: 3,
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Image.memory(_signatureImage!),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    AppLocalizations.of(context)!.tapToSign,
                                    style: AppStyle.headingText,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: viewModel.isCertified,
                    onChanged: (value) {
                      setState(() {
                        viewModel.isCertified = value!;
                      });
                    },
                    title: Text(
                      AppLocalizations.of(context)!.certificationCheckbox,
                      style: AppStyle.labelText,
                    ),
                  ),
                ],
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
