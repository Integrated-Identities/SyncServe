import 'package:flutter/material.dart';

class CustomerApprovalViewModel {
  TextEditingController customerNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool isChecked = false;
  bool isCertified = false;

  void dispose() {
    customerNameController.dispose();
    phoneNumberController.dispose();
  }

  void reset() {
    customerNameController.clear;
    phoneNumberController.clear();
  }

  void toggleCertified(bool? value) {
    isCertified = value ?? false;
  }
}
