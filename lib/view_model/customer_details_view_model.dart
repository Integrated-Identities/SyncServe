import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/model/customer.dart';
import 'package:syncserve/providers/customer_providers.dart';

class CustomerDetailsViewModel {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();

  void save(WidgetRef ref) {
    final customer = Customer(
      name: nameController.text.trim(),
      address: addressController.text.trim(),
      email: emailController.text.trim(),
    );
    ref.read(customerProvider.notifier).state = customer;
  }

  void dispose() {
    nameController.dispose();
    addressController.dispose();
    emailController.dispose();
  }

  void reset() {
    nameController.clear();
    addressController.clear();
    emailController.clear();
  }
}
