import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/model/user_profile_model.dart';
import 'package:syncserve/providers/employee_providers.dart';

/// Provider for user profile data
final userProfileNotifierProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfile?>((ref) {
  return UserProfileNotifier(ref);
});

/// User profile notifier for managing profile state
class UserProfileNotifier extends StateNotifier<UserProfile?> {
  UserProfileNotifier(this.ref) : super(null) {
    // Initialize from employee data if available
    final employeeData = ref.read(employeeProvider);
    if (employeeData != null) {
      state = UserProfile(
        name: employeeData.name,
        email: employeeData.email,
        address: employeeData.address,
        phone: employeeData.phone,
      );
    }
  }

  final Ref ref;

  /// Update user profile
  void updateProfile(UserProfile profile) {
    state = profile;
  }

  /// Update specific fields
  void updateField({
    String? name,
    String? email,
    String? address,
    String? phone,
    String? profileImageUrl,
  }) {
    if (state == null) return;

    state = state!.copyWith(
      name: name ?? state!.name,
      email: email ?? state!.email,
      address: address ?? state!.address,
      phone: phone ?? state!.phone,
      profileImageUrl: profileImageUrl ?? state!.profileImageUrl,
    );
  }

  /// Clear profile data
  void clearProfile() {
    state = null;
  }
}
