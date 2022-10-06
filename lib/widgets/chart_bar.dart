import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double percentageOfTotal;

  const ChartBar(this.label, this.amount, this.percentageOfTotal, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (buildContext, constraints) {
      return Column(
        children: [
          /*FittedBox(
            child: Text(
              amount.toStringAsFixed(2),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          const SizedBox(
            height: 4,
          ), */
          SizedBox(
            height: constraints.maxHeight * 0.75,
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
                      color: Theme.of(context).primaryColor,
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
