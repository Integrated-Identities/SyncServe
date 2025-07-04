import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/view/login.dart';
import 'package:syncserve/view/dashboard.dart'; // Import Dashboard
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Load .env if it exists, otherwise fall back to .env-local
  await dotenv
      .load(fileName: '.env')
      .catchError((_) => dotenv.load(fileName: '.env-local'));

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoggedIn = false;
    // check if employee is details are saved in storage
    return MaterialApp(
      theme: ThemeData(
        checkboxTheme: AppStyle.checkboxThemeData,
        textTheme: GoogleFonts.notoSansTextTheme(ThemeData.light().textTheme),
      ),
      locale: const Locale('en'),
      title: 'SyncServe',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      home: isLoggedIn ? const Dashboard() : const Login(),
    );
  }
}
