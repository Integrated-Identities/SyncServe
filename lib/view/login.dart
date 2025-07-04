import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/enums/auth.dart';
import 'package:syncserve/exceptions/auth_exception.dart';
import 'package:syncserve/services/message_service.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:syncserve/view/employee_details.dart';
import 'package:syncserve/view_model/login_view_model.dart';
import 'package:zod_validation/zod_validation.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginViewModelProvider);
    final notifier = ref.read(loginViewModelProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        height: 120,
                        width: 120,
                        child: Image.asset(
                          'assets/images/app_icon.png',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.business,
                                size: 60,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.welcome,
                      style: AppStyle.headingText,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 5),
                      child: TextFormField(
                        initialValue: state.email,
                        onChanged: notifier.updateEmail,
                        validator: (value) {
                          return Zod()
                              .required(
                                AppLocalizations.of(context)!.emailRequired,
                              )
                              .email(
                                AppLocalizations.of(context)!.emailInvalid,
                              )
                              .build(value);
                        },
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: const [AutofillHints.email],
                        autocorrect: false,
                        cursorColor: Colors.black,
                        decoration: AppStyle.inputDecorationWithLabel(
                          AppLocalizations.of(context)!.email,
                        ),
                      ),
                    ),

                    //TEXTFIELD OF PASSWORD
                    TextFormField(
                      initialValue: state.password,
                      onChanged: notifier.updatePassword,
                      cursorColor: Colors.black,
                      obscureText: !state.isPasswordVisible,
                      validator: (value) {
                        return Zod()
                            .required(
                              AppLocalizations.of(context)!.passwordRequired,
                            )
                            .build(value);
                      },
                      decoration: AppStyle.inputDecorationWithLabel(
                        AppLocalizations.of(context)!.password,
                      ).copyWith(
                        suffixIcon: IconButton(
                          onPressed: notifier.togglePasswordVisibility,
                          icon: Icon(
                            state.isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    // ELEVATED BUTTON OF LOG IN
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: ElevatedButton(
                        onPressed: state.isLoading ? null : _handleLogin,
                        style: AppStyle.primaryElevatedButtonStyle(),
                        child: state.isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(AppLocalizations.of(context)!.logIn),
                      ),
                    ),
                    //FORGOT PASSWORD
                    TextButton(
                      onPressed: state.isLoading ? null : _handleForgotPassword,
                      style: AppStyle.hintTextButton,
                      child: Text(AppLocalizations.of(context)!.forgotPassword),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      final success = await ref.read(loginViewModelProvider.notifier).login();
      if (!success) return;

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const EmployeeDetails(),
          ),
        );
      }
    } on AuthException catch (e) {
      if (mounted) {
        late final String errorMessage;
        switch (e.type) {
          case AuthErrorType.userNotFound:
            errorMessage = AppLocalizations.of(context)!.userNotFound;
            break;
          case AuthErrorType.wrongPassword:
            errorMessage = AppLocalizations.of(context)!.incorrectPassword;
            break;
          case AuthErrorType.invalidCredential:
            errorMessage = AppLocalizations.of(context)!.invalidCredentials;
            break;
          case AuthErrorType.userDisabled:
            errorMessage = AppLocalizations.of(context)!.userDisabled;
            break;
          default:
            errorMessage = AppLocalizations.of(context)!.unknownLoginError;
            break;
        }
        MessageService.showError(
          context,
          errorMessage,
        );
      }
    } catch (_) {
      if (mounted) {
        MessageService.showError(
          context,
          AppLocalizations.of(context)!.unknownLoginError,
        );
      }
    }
  }

  Future<void> _handleForgotPassword() async {
    try {
      final success = await ref
          .read(loginViewModelProvider.notifier)
          .sendPasswordResetEmail();
      if (!success) return;

      if (mounted) {
        MessageService.showSuccess(
          context,
          AppLocalizations.of(context)!.passwordResetEmailSent,
        );
      }
    } on AuthException catch (e) {
      if (mounted) {
        late final String errorMessage;
        switch (e.type) {
          case AuthErrorType.userNotFound:
            errorMessage = AppLocalizations.of(context)!.userNotFound;
            break;
          case AuthErrorType.invalidEmail:
            errorMessage = AppLocalizations.of(context)!.emailInvalid;
            break;
          case AuthErrorType.unknown:
            errorMessage =
                AppLocalizations.of(context)!.unknownForgotPasswordError;
            break;
          default:
            errorMessage =
                AppLocalizations.of(context)!.unknownForgotPasswordError;
            break;
        }

        MessageService.showError(
          context,
          errorMessage,
        );
      }
    } catch (_) {
      if (mounted) {
        MessageService.showError(
          context,
          AppLocalizations.of(context)!.unknownForgotPasswordError,
        );
      }
    }
  }
}
