import 'package:flutter/material.dart';
import 'package:meu_negocio_app/config/ThemeApp.dart';
import 'package:meu_negocio_app/ui/login/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
    theme: ThemeApp.themeData(),
    darkTheme: ThemeApp.darkThemeData(),
    debugShowCheckedModeBanner: false,
    home: const Login(),
    );
  }
}
