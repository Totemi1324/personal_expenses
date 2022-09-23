import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

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

  TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions
          .map(
            (e) => Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: categoryIcons[e.category]!['theme'] as Color,
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                        ),
                        child: Icon(
                          categoryIcons[e.category]!['icon'] as IconData,
                          color: Colors.black,
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
    );
  }
}
