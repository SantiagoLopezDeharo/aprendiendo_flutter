import 'package:flutter/material.dart';
import 'package:control_gastos/gastos.dart';

var KColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 144, 227, 167));
var KDarkColorScheme = ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: const Color.fromARGB(255, 47, 70, 54));
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: KDarkColorScheme,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: KDarkColorScheme.primaryContainer,
            ),
          ),
          cardTheme: const CardTheme().copyWith(
            color: KDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 9),
          ),
        ),
        theme: ThemeData().copyWith(
          colorScheme: KColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: KColorScheme.onSecondaryContainer,
            foregroundColor: KColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: KColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 9),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: KColorScheme.primaryContainer,
            ),
          ),
        ),
        themeMode: ThemeMode.system,
        home: Gastos());
  }
}
