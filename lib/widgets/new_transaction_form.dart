import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactionForm extends StatefulWidget {
  final Function onAdd;

  const NewTransactionForm(this.onAdd, {super.key});

  @override
  State<NewTransactionForm> createState() => _NewTransactionFormState();
}

class _NewTransactionFormState extends State<NewTransactionForm> {
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _onSubmitData(BuildContext buildContext) {
    final enteredDescription = _descriptionController.text;
    double enteredAmount = 0;

    if (enteredDescription.isEmpty ||
        _amountController.text.isEmpty ||
        _selectedDate == null) {
      return;
    }

    try {
      enteredAmount = double.parse(_amountController.text);
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

    widget.onAdd(enteredDescription, enteredAmount,
        _selectedDate);

    Navigator.of(buildContext).pop();
  }

  void _presentDatePicker() {
    var currentYear = DateTime.now().year;

    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(currentYear),
      lastDate: DateTime(currentYear + 1),
    ).then((pickedDate) {
      if (pickedDate == null) return;

      setState(() {
        _selectedDate = pickedDate;
      });
    }); //Test
    //If transaction added that lies in the future: Display warning, mark as provisional, ask at the day that it's due if it should be kept, in the options menu the user can choose whether to include provisional transaction in total balance
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
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Beschreibung',
              ),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Betrag',
              ),
              keyboardType: TextInputType
                  .number, // On iOS: TextInputType.numberWithOptions(decimal: true)
            ),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_selectedDate == null
                      ? "Kein Datum ausgewählt."
                      : "Datum: ${DateFormat("d/M/y").format(_selectedDate as DateTime)}"),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                    onPressed: _presentDatePicker,
                    child: const Text(
                      "Auswählen",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => _onSubmitData(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: const Text(
                'Hinzufügen',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
