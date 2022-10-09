import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import '../models/settings.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transactionData;

  const TransactionItem(this.transactionData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: categoryIcons[transactionData.category]!['theme'] as Color,
              border: Border.all(
                color: Colors.black,
                width: 3,
              ),
            ),
            child: Stack(
              children: [
                Icon(
                  categoryIcons[transactionData.category]!['icon_fill']
                      as IconData,
                  color: Colors.white,
                  size: 40,
                ),
                Icon(
                  categoryIcons[transactionData.category]!['icon_outline']
                      as IconData,
                  color: Colors.black,
                  size: 40,
                ),
              ],
            ),
          ),
          title: Text(
            transactionData.desc,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          subtitle: Text(
            DateFormat('d. MMMM y').format(transactionData.date),
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          trailing: SizedBox(
            width: 100,
            height: double.infinity,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: Text(
                "${transactionData.type == TransactionType.expense ? "- " : ""}${transactionData.amount.toStringAsFixed(2)} ${currencySymbols[currentCurrency]}",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: transactionData.type == TransactionType.expense
                      ? const Color.fromARGB(255, 230, 126, 164)
                      : const Color.fromARGB(255, 180, 211, 137),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
