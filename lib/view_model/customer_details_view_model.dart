import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/model/customer_detail_model.dart';
import 'package:syncserve/providers/customer_providers.dart';
import 'package:syncserve/constants/storage_keys.dart';

class CustomerDetailsViewModel {
  //CustomerDetailsViewModel(NonSecureStorageService storage);

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();

  Future<void> save(WidgetRef ref) async {
    final storage = await ref.read(nonSecureStorageProvider.future);

    final customer = Customer(
      name: nameController.text.trim(),
      address: addressController.text.trim(),
      email: emailController.text.trim(),
    );
    ref.read(customerProvider.notifier).state = customer;

    // Persist to local storage
    await storage.saveString(
      key: StorageKeys.customerName,
      value: customer.name,
    );
    await storage.saveString(
      key: StorageKeys.customerAddress,
      value: customer.address,
    );
    await storage.saveString(
      key: StorageKeys.customerEmail,
      value: customer.email,
    );
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
