
class Transaction {
  int? id = 11;
  String? nameTransaction ;
  DateTime? date = DateTime.now();
  String? typeTransaction= 'input';
  double? value ;

  Transaction({
    id,
    nameTransaction,
    date,
    typeTransaction,
    value,
  });
}

 