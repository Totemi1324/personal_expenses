import 'package:flutter/material.dart';
import './transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PersEx - Expense tracker",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
      id: '1',
      title: 'Müsli mit Milch',
      amount: 4.20,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Rhiihr Shieeish-Hülle',
      amount: 69.69,
      date: DateTime.now(),
    )
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(
            color: Colors.blue,
            child: Text("CHART HERE"),
          ),
          Column(
            children: transaction
                .map(
                  (e) => Card(
                    child: Text(e.title),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
