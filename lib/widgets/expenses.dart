import 'package:expense_tracking/models/expense.dart';
import 'package:expense_tracking/widgets/list/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    List<Expense> expenses = [
      Expense(
          title: 'Groceries',
          amount: 100.00,
          date: DateTime.now(),
          category: Category.Food),
      Expense(
          title: 'Groceries',
          amount: 100.00,
          date: DateTime.now(),
          category: Category.Food),
      Expense(
          title: 'Groceries',
          amount: 100.00,
          date: DateTime.now(),
          category: Category.Food),
      Expense(
          title: 'Groceries',
          amount: 100.00,
          date: DateTime.now(),
          category: Category.Food),
      Expense(
          title: 'Groceries',
          amount: 100.00,
          date: DateTime.now(),
          category: Category.Food),
      Expense(
          title: 'Groceries',
          amount: 100.00,
          date: DateTime.now(),
          category: Category.Food),
      Expense(
          title: 'Groceries',
          amount: 100.00,
          date: DateTime.now(),
          category: Category.Food),
    ];
    return Scaffold(
        body: Column(
      children: [
        const Text('The chart'),
        Expanded(child: ExpensesList(expenses: expenses))
      ],
    ));
  }
}
