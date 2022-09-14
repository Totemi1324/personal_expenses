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
      desc: 'Müsli mit Milch',
      category: 'Lebensmittel',
      amount: 4.20,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      desc: 'Rhiihr Shieeish-Hülle',
      category: 'Gadgets',
      amount: 69.69,
      date: DateTime.now(),
    )
  ];
  final Map<String, Map<String, Object>> categoryIcons = {
    'Lebensmittel': {
      'icon': Icons.shopping_basket_rounded,
      'theme': Colors.teal,
    },
    'Gadgets': {
      'icon': Icons.memory_rounded,
      'theme': Colors.red.shade700,
    }
  };
  final Map<String, String> currencySymbols = {
    'Euro': '€',
    'US-Dollar': '\$',
    'Schweizer Franken': 'CHF',
  };
  int currentCurrency = 2;

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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  categoryIcons[e.category]!['theme'] as Color),
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
                              e.date.toString(),
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
                            "${e.amount} ${currencySymbols['Schweizer Franken']}",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: e.amount > 0 ? Colors.green.shade900 : (e.amount < 0 ? Colors.red.shade900 : Colors.grey)
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
