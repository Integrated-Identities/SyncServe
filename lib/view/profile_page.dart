import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncserve/custom_controls/validated_textfield.dart';
import 'package:syncserve/model/user_profile_model.dart';
import 'package:syncserve/providers/user_profile_provider.dart';
import 'package:syncserve/services/message_service.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:syncserve/view/login.dart';
import 'package:syncserve/view_model/profile_view_model.dart';
import 'package:zod_validation/zod_validation.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userProfileNotifierProvider);
    final profileState = ref.watch(profileViewModelProvider);
    final profileNotifier = ref.read(profileViewModelProvider.notifier);
    final formKey = useMemoized(() => GlobalKey<FormState>());

    // Initialize controllers when profile loads
    useEffect(
      () {
        if (userProfile != null) {
          profileNotifier.initializeControllers(userProfile);
        }
        return null;
      },
      [userProfile],
    );

    // Handle success/error messages
    useEffect(
      () {
        if (profileState.successMessage != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            MessageService.showSuccess(context, profileState.successMessage!);
          });
        }
        if (profileState.errorMessage != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            MessageService.showError(context, profileState.errorMessage!);
          });
        }
        return null;
      },
      [profileState.successMessage, profileState.errorMessage],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.profilePage),
        centerTitle: true,
        backgroundColor: AppStyle.appBarNavBarCardAndCanvasColor,
        automaticallyImplyLeading: false,
        actions: [
          if (!profileState.isEditing)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: profileNotifier.toggleEditMode,
              tooltip: 'Edit Profile',
            ),
        ],
      ),
      body: userProfile == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Header Section
                    _ProfileHeaderSection(
                      userProfile: userProfile,
                      isEditing: profileState.isEditing,
                      nameController: profileNotifier.nameController,
                      onImagePick: () => _pickProfileImage(context),
                    ),

                    // Contact Information Section
                    _ContactInformationSection(
                      isEditing: profileState.isEditing,
                      emailController: profileNotifier.emailController,
                      phoneController: profileNotifier.phoneController,
                      addressController: profileNotifier.addressController,
                    ),

                    // Account Actions Section
                    if (!profileState.isEditing) ...[
                      _AccountActionsSection(
                        onChangePassword: () =>
                            _handleChangePassword(context, profileNotifier),
                        onSignOut: () =>
                            _handleSignOut(context, ref, profileNotifier),
                        isLoading: profileState.isLoading,
                      ),
                    ],

                    // Edit Mode Actions
                    if (profileState.isEditing) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: profileState.isLoading
                                  ? null
                                  : () =>
                                      profileNotifier.cancelEdit(userProfile),
                              child: const Text('Cancel'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: profileState.isLoading
                                  ? null
                                  : () => _handleUpdateProfile(
                                        context,
                                        formKey,
                                        profileNotifier,
                                      ),
                              style: AppStyle.primaryElevatedButtonStyle(),
                              child: profileState.isLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text('Save'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> _handleUpdateProfile(
    BuildContext context,
    GlobalKey<FormState> formKey,
    ProfileViewModel profileNotifier,
  ) async {
    if (formKey.currentState?.validate() ?? false) {
      final success = await profileNotifier.updateProfile();
      if (success && context.mounted) {
        MessageService.showSuccess(
          context,
          'Profile updated successfully',
        );
      }
    }
  }

  Future<void> _handleChangePassword(
    BuildContext context,
    ProfileViewModel profileNotifier,
  ) async {
    final success = await profileNotifier.sendPasswordResetEmail();
    if (success && context.mounted) {
      MessageService.showSuccess(
        context,
        AppLocalizations.of(context)!.passwordResetEmailSent,
      );
    }
  }

  Future<void> _handleSignOut(
    BuildContext context,
    WidgetRef ref,
    ProfileViewModel profileNotifier,
  ) async {
    final shouldSignOut = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.logOut),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(AppLocalizations.of(context)!.logOut),
          ),
        ],
      ),
    );

    if (shouldSignOut == true) {
      final success = await profileNotifier.signOut();
      if (success && context.mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Login()),
        );
      }
    }
  }

  Future<void> _pickProfileImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    try {
      final ImageSource? source = await showDialog<ImageSource>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () => Navigator.of(context).pop(ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () => Navigator.of(context).pop(ImageSource.gallery),
              ),
            ],
          ),
        ),
      );

      if (source != null) {
        final XFile? image = await picker.pickImage(
          source: source,
          maxWidth: 800,
          maxHeight: 800,
          imageQuality: 85,
        );

        if (image != null && context.mounted) {
          // TODO: Upload image to storage and update profile
          // For now, just show success message
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Image selected. Upload functionality will be implemented.',
                ),
              ),
            );
          }
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error selecting image: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

class _ProfileHeaderSection extends StatelessWidget {
  const _ProfileHeaderSection({
    required this.userProfile,
    required this.isEditing,
    required this.nameController,
    this.onImagePick,
  });

  final UserProfile userProfile;
  final bool isEditing;
  final TextEditingController nameController;
  final VoidCallback? onImagePick;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Picture
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: userProfile.profileImageUrl != null
                      ? NetworkImage(userProfile.profileImageUrl!)
                      : null,
                  child: userProfile.profileImageUrl == null
                      ? Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.grey[600],
                        )
                      : null,
                ),
                if (isEditing)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt, color: Colors.white),
                        onPressed: onImagePick,
                        iconSize: 20,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),

            // Name
            SizedBox(
              width: double.infinity,
              child: isEditing
                  ? ValidatedTextField(
                      controller: nameController,
                      label: 'Employee Name',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Employee name is required';
                        }
                        return Zod()
                            .required('Employee name is required')
                            .build(value);
                      },
                      decoration:
                          AppStyle.inputDecorationWithLabel('Employee Name'),
                      isRequired: true,
                    )
                  : Text(
                      userProfile.name,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                      textAlign: TextAlign.center,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactInformationSection extends StatelessWidget {
  const _ContactInformationSection({
    required this.isEditing,
    required this.emailController,
    required this.phoneController,
    required this.addressController,
  });

  final bool isEditing;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Information',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),

            // Email
            if (isEditing)
              ValidatedTextField(
                controller: emailController,
                label: 'Employee Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Employee email is required';
                  }
                  return Zod()
                      .required('Employee email is required')
                      .email('Employee email invalid')
                      .build(value);
                },
                decoration: AppStyle.inputDecorationWithLabel('Employee Email'),
                isRequired: true,
              )
            else
              _InfoTile(
                icon: Icons.email,
                label: 'Email',
                value: emailController.text,
              ),

            // Phone
            if (isEditing)
              ValidatedTextField(
                controller: phoneController,
                label: 'Phone Number',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value != null && value.trim().isNotEmpty) {
                    // Basic phone validation
                    if (value.trim().length < 10) {
                      return 'Please enter a valid phone number';
                    }
                  }
                  return null;
                },
                decoration: AppStyle.inputDecorationWithLabel('Phone Number'),
              )
            else if (phoneController.text.isNotEmpty)
              _InfoTile(
                icon: Icons.phone,
                label: 'Phone Number',
                value: phoneController.text,
              ),

            // Address
            if (isEditing)
              ValidatedTextField(
                controller: addressController,
                label: 'Employee Address',
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Employee address is required';
                  }
                  return Zod()
                      .required('Employee address is required')
                      .build(value);
                },
                decoration:
                    AppStyle.inputDecorationWithLabel('Employee Address'),
                isRequired: true,
              )
            else
              _InfoTile(
                icon: Icons.location_on,
                label: 'Employee Address',
                value: addressController.text,
                maxLines: 3,
              ),
          ],
        ),
      ),
    );
  }
}

class _AccountActionsSection extends StatelessWidget {
  const _AccountActionsSection({
    required this.onChangePassword,
    required this.onSignOut,
    required this.isLoading,
  });

  final VoidCallback onChangePassword;
  final VoidCallback onSignOut;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Actions',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),

            // Change Password
            ListTile(
              leading: const Icon(Icons.lock_outline),
              title: const Text('Change Password'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: isLoading ? null : onChangePassword,
            ),

            const Divider(),

            // Sign Out
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Log Out',
                style: TextStyle(color: Colors.red),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.red),
              onTap: isLoading ? null : onSignOut,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
    this.maxLines = 1,
  });

  final IconData icon;
  final String label;
  final String value;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.grey[600]),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
