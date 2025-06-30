import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/model/customer_detail_model.dart';
import 'package:syncserve/providers/customer_providers.dart';
import 'package:syncserve/services/non_secure_storage_service.dart';
import 'package:syncserve/constants/storage_keys.dart';

class CustomerDetailsViewModel {
  CustomerDetailsViewModel(this._storage);

  final NonSecureStorageService _storage;

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

    // Persist to local storage
    _storage.saveString(key: StorageKeys.customerName, value: customer.name);
    _storage.saveString(
      key: StorageKeys.customerAddress,
      value: customer.address,
    );
    _storage.saveString(key: StorageKeys.customerEmail, value: customer.email);
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

  Future<void> load() async {
    nameController.text =
        await _storage.getString(StorageKeys.customerName) ?? '';
    addressController.text =
        await _storage.getString(StorageKeys.customerAddress) ?? '';
    emailController.text =
        await _storage.getString(StorageKeys.customerEmail) ?? '';
  }
}
