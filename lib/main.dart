import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/Expenses.dart';

final KcolorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 56, 181));
void main() {
  runApp(MaterialApp(
    home: const Expenses(),
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
  ));
}
