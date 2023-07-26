import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Category { food, travel, leisure, work }

final formatter = DateFormat.yMd();
const uuid = Uuid();
const categoryIcons = {
  Category.food: Icons.dinner_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff_outlined,
  Category.work: Icons.work_outline,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatteddate {
    return formatter.format(date);
  }
}