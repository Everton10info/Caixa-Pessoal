import 'dart:math';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';

class Transaction {
  int? id = 11;
  String? nameTransaction = 'DESU NO COMANDO';
  DateTime? date;
  String? typeTransaction = 'output';
  double? value = 22.3;

  Transaction({
    id,
    nameTransaction,
    date,
    typeTransaction,
    value,
  });
}

 