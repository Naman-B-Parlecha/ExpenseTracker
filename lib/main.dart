import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/Expenses.dart';

void main() {
  runApp(MaterialApp(
    home: const Expenses(),
    theme: ThemeData(useMaterial3: true),
  ));
}
