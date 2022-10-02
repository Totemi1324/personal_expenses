import 'package:flutter/material.dart';

class NewTransactionForm extends StatefulWidget {
  final Function onAdd;

  const NewTransactionForm(this.onAdd, {super.key});

  @override
  State<NewTransactionForm> createState() => _NewTransactionFormState();
}

class _NewTransactionFormState extends State<NewTransactionForm> {
  final descriptionController = TextEditingController();

  final amountController = TextEditingController();

  void onSubmitData(BuildContext buildContext) {
    final enteredDescription = descriptionController.text;
    double enteredAmount = 0;

    if (enteredDescription.isEmpty || amountController.text.isEmpty) {
      return;
    }

    try {
      enteredAmount = double.parse(amountController.text);
    } on Exception catch (_) {
      showDialog(
          context: context,
          builder: (dialogBuildContext) {
            return AlertDialog(
              title: const Text("Wrong input"),
              content:
                  const Text("The amount you entered is not a valid number."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogBuildContext).pop(),
                  child: const Text("OK"),
                )
              ],
            );
          });
    }

    if (enteredAmount <= 0) {
      return;
    }

    widget.onAdd(
        enteredDescription, enteredAmount); //When stateful: widget.onAdd

    Navigator.of(buildContext).pop();
  }

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
              onSubmitted: (_) => onSubmitData(context),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'Betrag',
              ),
              keyboardType: TextInputType
                  .number, // On iOS: TextInputType.numberWithOptions(decimal: true)
              onSubmitted: (_) => onSubmitData(context),
            ),
            TextButton(
              onPressed: () => onSubmitData(context),
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
