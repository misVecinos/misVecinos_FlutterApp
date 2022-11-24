import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/splash/splash.dart';

import 'ui/utils/colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mis Vecinos App',
      //Tema por default de la app
      theme: ThemeData(
          fontFamily: 'Montserrat',
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: c.primary,
              onPrimary: c.primary,
              secondary: c.secondary,
              onSecondary: c.secondary,
              error: c.error,
              onError: c.error,
              background: c.secondary,
              onBackground: c.secondary,
              surface: c.surface,
              onSurface: c.surface)),
      home: SplashScreen(),
    );
  }
}
