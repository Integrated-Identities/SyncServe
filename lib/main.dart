import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/view/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/theme/styles.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        checkboxTheme: AppStyle.checkboxThemeData,
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
      home: Login(),
    );
  }
}
