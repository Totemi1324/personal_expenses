import 'package:flutter/material.dart';

import './transaction_list.dart';
import './new_transaction_form.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      desc: 'Müsli mit Milch',
      category: 'Lebensmittel',
      amount: 4.20,
      type: TransactionType.expense,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      desc: 'Rhiihr Shieeish-Hülle',
      category: 'Gadgets',
      amount: 69.69,
      type: TransactionType.expense,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String desc, double amount) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        desc: desc,
        category: 'Gadgets',
        amount: amount,
        type: TransactionType.expense,
        date: DateTime.now());
    
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransactionForm(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
