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

  void removeexpense(Expense expense) {
    final indexing = expenseslist.indexOf(expense);
    setState(() {
      expenseslist.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      content: Text('Expense deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              expenseslist.insert(indexing, expense);
            });
          }),
    ));
  }

  @override
  Widget build(context) {
    Widget maincontent =
        Center(child: Text('No expense found. Kindly enter a new expense'));

    if (expenseslist.isNotEmpty) {
      maincontent = ExpensesListWidget(
        expenseslist,
        removeExpenses: removeexpense,
      );
    }

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
        children: [const Text('Graph'), Expanded(child: maincontent)],
      ),
    );
  }
}
