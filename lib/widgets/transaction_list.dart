import 'package:flutter/material.dart';

import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {super.key});

  // Layout for currency compliance:
  // +--------------------------+
  // | IC  Description          |
  // | ON  Date                 |
  // |          [AMOUNT] [CURR] |
  // +--------------------------+

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (buildContext, constraints) {
            return Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.5,
                  child: Image.asset(
                    "assets/images/empty_list.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Noch keine Transaktionen angegeben...",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) =>
                TransactionItem(transactions[index]),
            itemCount: transactions.length,
          );
  }
}
