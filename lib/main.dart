import 'package:flutter/material.dart';
import 'package:expense_tracking/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(useMaterial3: true),
      home: const Expenses(),
    ),
  );
}
