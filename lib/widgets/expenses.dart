import 'package:expense_tracking/models/expense.dart';
import 'package:expense_tracking/widgets/list/expenses_list.dart';
import 'package:expense_tracking/widgets/new_expense.dart';
import 'package:expense_tracking/widgets/chart/chart.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _registered_expenses = [
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
        amount: 300.00,
        date: DateTime.now(),
        category: Category.Travel),
    Expense(
        title: 'rent',
        amount: 1000.00,
        date: DateTime.now(),
        category: Category.Leisure),
    Expense(
        title: 'Clothes zara',
        amount: 1050.00,
        date: DateTime.now(),
        category: Category.Shopping),
    Expense(
        title: 'Iqos',
        amount: 100.00,
        date: DateTime.now(),
        category: Category.Shopping),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registered_expenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registered_expenses.indexOf(expense);
    setState(() {
      _registered_expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("expense deleted"),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registered_expenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseDialog() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isLandscape = width > 600;

    Widget mainContent = const Center(
      child: Text("No expenses found, start adding some"),
    );

    if (_registered_expenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registered_expenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker'), actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _openAddExpenseDialog,
        )
      ]),
      body: !isLandscape
          ? Column(
              children: [
                Chart(expenses: _registered_expenses),
                Expanded(
                  child: mainContent,
                )
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registered_expenses),
                ),
                Expanded(
                  child: mainContent,
                )
              ],
            ),
    );
  }
}
