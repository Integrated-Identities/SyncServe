import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/model/user_profile_model.dart';
import 'package:syncserve/model/employee_details_model.dart';
import 'package:syncserve/providers/user_profile_provider.dart';
import 'package:syncserve/providers/employee_providers.dart';
import 'package:syncserve/services/firebase_auth_service.dart';

/// Profile editing state
class ProfileEditState {
  const ProfileEditState({
    this.isLoading = false,
    this.isEditing = false,
    this.errorMessage,
    this.successMessage,
  });

  final bool isLoading;
  final bool isEditing;
  final String? errorMessage;
  final String? successMessage;

  ProfileEditState copyWith({
    bool? isLoading,
    bool? isEditing,
    String? errorMessage,
    String? successMessage,
  }) {
    return ProfileEditState(
      isLoading: isLoading ?? this.isLoading,
      isEditing: isEditing ?? this.isEditing,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }
}

/// Provider for profile view model
final profileViewModelProvider =
    StateNotifierProvider<ProfileViewModel, ProfileEditState>((ref) {
  return ProfileViewModel(ref);
});

/// Profile view model for managing profile operations
class ProfileViewModel extends StateNotifier<ProfileEditState> {
  ProfileViewModel(this.ref) : super(const ProfileEditState());

  final Ref ref;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  /// Initialize controllers with current profile data
  void initializeControllers(UserProfile? profile) {
    if (profile != null) {
      nameController.text = profile.name;
      emailController.text = profile.email;
      addressController.text = profile.address;
      phoneController.text = profile.phone ?? '';
    }
  }

  /// Toggle edit mode
  void toggleEditMode() {
    state = state.copyWith(isEditing: !state.isEditing);
  }

  /// Cancel editing and reset controllers
  void cancelEdit(UserProfile? profile) {
    state = state.copyWith(isEditing: false, errorMessage: null);
    initializeControllers(profile);
  }

  /// Update profile with current form data
  Future<bool> updateProfile() async {
    if (state.isLoading) return false;

    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
    );

    try {
      final updatedProfile = UserProfile(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        address: addressController.text.trim(),
        phone: phoneController.text.trim().isEmpty
            ? null
            : phoneController.text.trim(),
      );

      // Update the profile
      ref
          .read(userProfileNotifierProvider.notifier)
          .updateProfile(updatedProfile);

      // Also sync with employee provider
      final employeeData = EmployeeDetailsModel(
        name: updatedProfile.name,
        email: updatedProfile.email,
        address: updatedProfile.address,
        phone: updatedProfile.phone,
      );
      ref.read(employeeProvider.notifier).state = employeeData;

      state = state.copyWith(
        isLoading: false,
        isEditing: false,
        successMessage: 'Profile updated successfully',
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to update profile. Please try again.',
      );
      return false;
    }
  }

  /// Sign out user
  Future<bool> signOut() async {
    if (state.isLoading) return false;

    state = state.copyWith(isLoading: true);

    try {
      final authService = ref.read(firebaseAuthProvider);
      await authService.signOut();

      // Clear profile data
      ref.read(userProfileNotifierProvider.notifier).clearProfile();

      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Sign out failed. Please try again.',
      );
      return false;
    }
  }

  /// Send password reset email
  Future<bool> sendPasswordResetEmail() async {
    if (state.isLoading) return false;

    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
    );

    try {
      final authService = ref.read(firebaseAuthProvider);
      await authService.sendPasswordResetEmail(emailController.text.trim());

      state = state.copyWith(
        isLoading: false,
        successMessage: 'Password reset email has been sent',
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to send password reset email. Please try again.',
      );
      return false;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
