// this file is for main screen design

import 'package:flutter/material.dart';
import 'package:expense_tracker/models/Expense.dart';
import 'package:expense_tracker/widgets/ExpensesListWidget.dart';
import 'package:expense_tracker/widgets/NewExpenses.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  List<Expense> expenseslist = [
    Expense(
        title: 'Futter course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 15.69,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  void addExpensesDetails() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => AddNewExpense(newexpenseadding));
  }

  void newexpenseadding(Expense expense) {
    setState(() {
      expenseslist.add(expense);
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: addExpensesDetails,
            icon: const Icon(Icons.add_rounded),
          )
        ],
      ),
      body: Column(
        children: [
          const Text('Graph'),
          Expanded(child: ExpensesListWidget(expenseslist))
        ],
      ),
    );
  }
}
