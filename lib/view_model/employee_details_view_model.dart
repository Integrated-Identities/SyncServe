import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/model/employee_details_model.dart';
import 'package:syncserve/providers/employee_providers.dart';

class EmployeeDetailsViewModel {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  void save(WidgetRef ref) {
    final employeeDetailsModel = EmployeeDetailsModel(
      name: nameController.text,
      email: emailController.text,
      address: addressController.text,
    );
    ref.read(employeeProvider.notifier).state = employeeDetailsModel;
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
  }

  void reset() {
    nameController.clear();
    emailController.clear();
    addressController.clear();
  }
}
