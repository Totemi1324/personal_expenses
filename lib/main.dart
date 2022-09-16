import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final Map<String, Map<String, Object>> categoryIcons = {
    'Lebensmittel': {
      'icon': Icons.shopping_basket_outlined,
      'theme': const Color.fromARGB(255, 181, 234, 215),
    },
    'Gadgets': {
      'icon': Icons.memory_outlined,
      'theme': const Color.fromARGB(255, 255, 154, 162),
    }
  };
  final Map<String, String> currencySymbols = {
    'Euro': '€',
    'US-Dollar': '\$',
    'Schweizer Franken': 'CHF',
  };
  String currentCurrency = 'Schweizer Franken';

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(
            color: Colors.blue,
            child: Text("CHART HERE"),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Beschreibung',
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Betrag',
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 150, 182, 197)),
                    ),
                    child: const Text(
                      'Transaktion hinzufügen',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: transaction
                .map(
                  (e) => Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  categoryIcons[e.category]!['theme'] as Color,
                              border: Border.all(
                                color: Colors.black,
                                width: 3,
                              )),
                          child: Icon(
                            categoryIcons[e.category]!['icon'] as IconData,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              e.desc,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              DateFormat('d. MMMM y').format(e.date),
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 80,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "${e.type == TransactionType.expense ? "- " : ""}${e.amount} ${currencySymbols[currentCurrency]}",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: e.type == TransactionType.expense
                                  ? const Color.fromARGB(255, 230, 126, 164)
                                  : const Color.fromARGB(255, 180, 211, 137),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
