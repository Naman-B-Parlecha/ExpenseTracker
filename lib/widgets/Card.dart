import 'package:flutter/material.dart';
import 'package:expense_tracker/models/Expense.dart';

class ExpenseDetails extends StatelessWidget {
  const ExpenseDetails(this.details, {super.key});
  final Expense details;
  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(children: [
          Text(details.title),
          const SizedBox(height: 7),
          Row(children: [
            Text("\$${(details.amount).toStringAsFixed(2)}"),
            const Spacer(),
            Row(
              children: [
                Icon(categoryIcons[details.category]),
                const SizedBox(width: 7),
                Text(details.formatteddate)
                // here we use formatteddate and not formatteddate() cuz we use get function //
              ],
            )
          ]),
        ]),
      ),
    );
  }
}
