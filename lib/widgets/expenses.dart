import 'package:expense_tracking/models/expense.dart';
import 'package:expense_tracking/widgets/list/expenses_list.dart';
import 'package:expense_tracking/widgets/nex_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  void _openAddExpenseDialog() {
    showModalBottomSheet(context: context, builder: (ctx) => NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    List<Expense> _registered_expenses = [
      Expense(
          title: 'Groceries',
          amount: 10.00,
          date: DateTime.now(),
          category: Category.Food),
      Expense(
          title: 'Money from job',
          amount: 3750.00,
          date: DateTime.now(),
          category: Category.Work),
      Expense(
          title: 'Glovo',
          amount: 50.00,
          date: DateTime.now(),
          category: Category.Food),
      Expense(
          title: 'Taxi',
          amount: 100.00,
          date: DateTime.now(),
          category: Category.Travel),
      Expense(
          title: 'rent',
          amount: 100000.00,
          date: DateTime.now(),
          category: Category.Leisure),
      Expense(
          title: 'Clothes zara',
          amount: 150.00,
          date: DateTime.now(),
          category: Category.Shopping),
      Expense(
          title: 'Iqos',
          amount: 100.00,
          date: DateTime.now(),
          category: Category.Shopping),
    ];
    return Scaffold(
        appBar: AppBar(title: const Text('Expense Tracker'), actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseDialog,
          )
        ]),
        body: Column(
          children: [
            const Text('The chart'),
            Expanded(child: ExpensesList(expenses: _registered_expenses))
          ],
        ));
  }
}
