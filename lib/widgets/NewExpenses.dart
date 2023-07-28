import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/Expense.dart';

final formatter = DateFormat.yMd();

class AddNewExpense extends StatefulWidget {
  const AddNewExpense(this.onAddExpense, {super.key});
  final void Function(Expense expense) onAddExpense;
  @override
  State<AddNewExpense> createState() {
    return _AddNewExpense();
  }
}

class _AddNewExpense extends State<AddNewExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;
  Category selectedCategory = Category.leisure;

  void addDatePicker() async {
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 2, now.month, now.day);

    final datepicked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstdate,
      lastDate: now,
    );
    setState(() {
      selectedDate = datepicked;
    });
  }

  void detailvalidater() {
    final enteramount = double.tryParse(amountController.text);
    final validamount = enteramount == null || enteramount <= 0;
    if (titleController.text.trim().isEmpty ||
        validamount ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text(
              'Kindly enter a valid title,amount,date and category to proceed'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Okay'))
          ],
        ),
      );
      return;
    } else {
      widget.onAddExpense(Expense(
          title: titleController.text,
          amount: enteramount,
          date: selectedDate!,
          category: selectedCategory));
    }
    Navigator.pop(context);
  }

  @override
  void dispose() {
    amountController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  maxLength: 20,
                  decoration: const InputDecoration(
                      prefixText: '\$', label: Text('Amount')),
                ),
              ),
              const SizedBox(width: 75),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      selectedDate == null
                          ? "Select A date"
                          : formatter.format(selectedDate!),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: addDatePicker,
                        icon: const Icon(Icons.calendar_month))
                  ]),
            ],
          ),
          Row(
            children: [
              DropdownButton(
                  value: selectedCategory,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      selectedCategory = value;
                    });
                  }),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                onPressed: detailvalidater,
                child: const Text('Save Expense'),
              )
            ],
          )
        ],
      ),
    );
  }
}
