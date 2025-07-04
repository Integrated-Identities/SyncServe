import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/view/customer_detail.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/view/login.dart';
import 'package:syncserve/services/firebase_auth_service.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.appBarNavBarCardAndCanvasColor,
        actions: [
          GestureDetector(
            onTap: () async {
              try {
                // Clear tokens and sign out
                final authService = ref.read(firebaseAuthProvider);
                await authService.signOut();

                // TODO: Clear employee data

                // Navigate to login
                if (context.mounted) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                }
              } catch (e) {
                // Handle sign out error if needed
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        AppLocalizations.of(context)!.signOutFailed,
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppLocalizations.of(context)!.logOut,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                'assets/images/dashboard_hero.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 64,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.hello,
              style: AppStyle.headingText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: AppStyle.primaryElevatedButtonStyle(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomerDetail(),
                    ),
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.startUPSservice,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: AppStyle.primaryElevatedButtonStyle(),
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)!.startGeneratorService,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppStyle.appBarNavBarCardAndCanvasColor,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}
