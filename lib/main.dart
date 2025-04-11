import 'package:flutter/material.dart';
import 'package:syncserve/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('es'),
      ],
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
