import 'package:flutter/material.dart';
import 'package:expense_tracker/models/Expense.dart';
import 'package:expense_tracker/widgets/Card.dart';

class ExpensesListWidget extends StatelessWidget {
  const ExpensesListWidget(this.listitems,
      {super.key, required this.removeExpenses});

  final void Function(Expense expense) removeExpenses;
  final List<Expense> listitems;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: listitems.length,
      itemBuilder: (context, index) => Dismissible(
          background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.8),
              margin: EdgeInsets.symmetric(
                  horizontal: Theme.of(context).cardTheme.margin!.horizontal)),
          key: ValueKey(listitems[index]),
          onDismissed: (direction) {
            removeExpenses(listitems[index]);
          },
          child: ExpenseDetails(listitems[index])),
    );
  }
}
