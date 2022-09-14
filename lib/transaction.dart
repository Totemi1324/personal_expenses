class Transaction {
  String id;
  String desc;
  String category;
  double amount;
  DateTime date;

  Transaction(
      {required this.id,
      required this.desc,
      required this.category,
      required this.amount,
      required this.date});
}
