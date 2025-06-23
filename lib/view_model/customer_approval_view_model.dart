import 'package:flutter/material.dart';

class CustomerApprovalViewModel {
  TextEditingController customerNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool isChecked = false;

  void dispose() {
    customerNameController.dispose();
    phoneNumberController.dispose();
  }

  void reset() {
    customerNameController.clear();
    phoneNumberController.clear();
  }
}
