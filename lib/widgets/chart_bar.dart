import 'package:flutter/material.dart';

import '../models/settings.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double percentageOfTotal;

  const ChartBar(this.label, this.amount, this.percentageOfTotal, {super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return LayoutBuilder(builder: (buildContext, constraints) {
      return Column(
        children: [
          if (isLandscape) SizedBox(
            height: constraints.maxHeight * 0.2,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "${amount.toStringAsFixed(2)}${currencySymbols[currentCurrency]}",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
          if (isLandscape) SizedBox(
            height: constraints.maxHeight * 0.05,
          ), 
          SizedBox(
            height: constraints.maxHeight * (isLandscape ? 0.50 : 0.75),
            width: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    color: const Color.fromARGB(255, 220, 220, 220),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentageOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.2,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          )
        ],
      );
    });
  }
}
