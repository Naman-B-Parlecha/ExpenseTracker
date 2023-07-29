import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/Expenses.dart';
import 'package:flutter/services.dart';

final KcolorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 56, 181));

final darkcolorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 5, 99, 125), brightness: Brightness.dark);
void main() {
  runApp(MaterialApp(
    home: const Expenses(),
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: darkcolorScheme,
      appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: darkcolorScheme.onPrimaryContainer,
          foregroundColor: darkcolorScheme.primaryContainer),
      cardTheme: const CardTheme().copyWith(
          color: darkcolorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: darkcolorScheme.primaryContainer,
              foregroundColor: darkcolorScheme.onPrimaryContainer)),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: darkcolorScheme.onSecondaryContainer,
                fontSize: 14),
          ),
    ),
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: KcolorScheme,
      appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: KcolorScheme.onPrimaryContainer,
          foregroundColor: KcolorScheme.primaryContainer),
      cardTheme: const CardTheme().copyWith(
          color: KcolorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: KcolorScheme.primaryContainer)),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: KcolorScheme.onSecondaryContainer,
                fontSize: 14),
          ),
    ),
    themeMode: ThemeMode.system,
  ));
}
