import 'package:flutter/material.dart';
import 'package:expense_tracking/widgets/expenses.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Expense Tracker',
      home: Expenses(),
    ),
  );
}
