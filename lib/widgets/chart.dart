import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactionValues {
    final generatedList = List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum
      };
    }).reversed.toList();

    Map<String, Object> current;
    while (generatedList[0]['day'] != 'Mon') {
      current = generatedList.removeAt(0);
      generatedList.add(current);
    }

    return generatedList;
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  const Chart(this.recentTransactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: groupedTransactionValues.map((daySaldo) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                daySaldo['day'] as String,
                daySaldo['amount'] as double,
                totalSpending > 0 ? (daySaldo['amount'] as double) / totalSpending : 0,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
