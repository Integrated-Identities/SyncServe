import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/model/customer.dart';

// Riverpod provider to hold selected customer details throughout the app
final customerProvider = StateProvider<Customer?>((ref) => null);
