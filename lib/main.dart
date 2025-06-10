import 'package:flutter/material.dart';
import 'package:syncserve/view/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/theme/styles.dart';

void main() {
  runApp(const MyApp());
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
