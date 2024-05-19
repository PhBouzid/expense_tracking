import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category {
  Food,
  Travel,
  Shopping,
  Work,
  Leisure,
}

const categoryIcons = {
  Category.Food: Icons.lunch_dining,
  Category.Travel: Icons.flight_takeoff,
  Category.Shopping: Icons.shopping_bag,
  Category.Leisure: Icons.movie,
  Category.Work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses.where((ex) => ex.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get TotalExpense {
    double sum = 0.0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
