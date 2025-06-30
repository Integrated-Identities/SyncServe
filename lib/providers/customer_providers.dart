import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/model/customer_detail_model.dart';
import 'package:syncserve/services/non_secure_storage_service.dart';
import 'package:syncserve/view_model/customer_details_view_model.dart';

// Riverpod provider to hold selected customer details throughout the app
final customerProvider = StateProvider<Customer?>((ref) => null);

final customerDetailsViewModelProvider =
    Provider<CustomerDetailsViewModel>((ref) {
  final storage = ref.read(nonSecureServiceProvider);
  return CustomerDetailsViewModel(storage);
});
