import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import '../models/settings.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  final Map<String, Map<String, Object>> categoryIcons = {
    'Lebensmittel': {
      'icon_outline': Icons.shopping_basket_outlined,
      'icon_fill': Icons.shopping_basket,
      'theme': const Color.fromARGB(255, 181, 234, 215),
    },
    'Gadgets': {
      'icon_outline': Icons.memory_outlined,
      'icon_fill': Icons.memory,
      'theme': const Color.fromARGB(255, 255, 154, 162),
    }
  };

  TransactionList(this.transactions, {super.key});

  // Layout for currency compliance:
  // +--------------------------+
  // | IC  Description          |
  // | ON  Date                 |
  // |          [AMOUNT] [CURR] |
  // +--------------------------+

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              SizedBox(
                height: 200,
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
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: categoryIcons[transactions[index].category]![
                            'theme'] as Color,
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Icon(
                            categoryIcons[transactions[index].category]![
                                'icon_fill'] as IconData,
                            color: Colors.white,
                            size: 40,
                          ),
                          Icon(
                            categoryIcons[transactions[index].category]![
                                'icon_outline'] as IconData,
                            color: Colors.black,
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                    title: Text(
                      transactions[index].desc,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat('d. MMMM y').format(transactions[index].date),
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
                          "${transactions[index].type == TransactionType.expense ? "- " : ""}${transactions[index].amount.toStringAsFixed(2)} ${currencySymbols[currentCurrency]}",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            color: transactions[index].type ==
                                    TransactionType.expense
                                ? const Color.fromARGB(255, 230, 126, 164)
                                : const Color.fromARGB(255, 180, 211, 137),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
