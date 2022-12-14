enum TransactionType {
  income,
  expense
}

class Transaction {
  String id;
  String desc;
  String category;
  double amount;
  TransactionType type;
  DateTime date;

  Transaction(
      {required this.id,
      required this.desc,
      required this.category,
      required this.amount,
      required this.type,
      required this.date});
}
