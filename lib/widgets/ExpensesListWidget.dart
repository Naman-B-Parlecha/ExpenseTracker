import 'package:flutter/material.dart';
import 'package:expense_tracker/models/Expense.dart';
import 'package:expense_tracker/widgets/Card.dart';

class ExpensesListWidget extends StatelessWidget {
  const ExpensesListWidget(this.listitems, {super.key});

  final List<Expense> listitems;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: listitems.length,
      itemBuilder: (context, index) => ExpenseDetails(listitems[index]),
    );
  }
}
