import 'package:flutter/material.dart';

import '../models/settings.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double percentageOfTotal;

  const ChartBar(this.label, this.amount, this.percentageOfTotal, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${amount.toStringAsFixed(2)} ${currencySymbols[currentCurrency]}",
        ),
        const SizedBox(
          height: 4,
        ),
        Container()
      ],
    );
  }
}
