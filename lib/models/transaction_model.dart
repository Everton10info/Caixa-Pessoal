
import 'dart:math';

class Transaction {
  int? id = Random().nextInt(90);
  String? nameTransaction ;
  DateTime? date = DateTime.now();
  String? typeTransaction;
  double? value ;

  Transaction({
    id,
    nameTransaction,
    date,
    typeTransaction,
    value,
  });
}

 