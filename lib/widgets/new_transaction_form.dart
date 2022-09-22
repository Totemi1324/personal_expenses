import 'package:flutter/material.dart';

class NewTransactionForm extends StatelessWidget {
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  final Function onAdd;

  NewTransactionForm(this.onAdd, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Beschreibung',
              ),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'Betrag',
              ),
            ),
            TextButton(
              onPressed: () => onAdd(descriptionController.text, double.parse(amountController.text)),
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
    );
  }
}
