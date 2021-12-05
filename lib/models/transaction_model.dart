import 'dart:math';
import 'package:intl/intl.dart';

class Transaction {
  int id = 0;
  String nameTransaction = 'curso flutter';
  String date = DateFormat('yyyy-mm-dd').format(DateTime.now());
  String typeTransaction = 'input';
  double value = 0.0;

  Transaction({
    id,
    nameTransaction,
    date,
    typeTransaction,
    value,
  });

 /*  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameTransaction': nameTransaction,
      'date': date,
      'typeTransaction': typeTransaction,
      'value': value
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
        id: map['id'],
        nameTransaction: map['nameTransaction'],
        date: map['date'],
        typeTransaction: map['typeTransaction'],
        value: map['value']);
  }  */
}
