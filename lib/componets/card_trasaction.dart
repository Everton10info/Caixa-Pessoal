import 'dart:developer';

import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardTransaction extends StatelessWidget {
 var transaction = Get.put(Transaction());
    late List<CardTransaction>? listCardTransactions=[];
  @override
  Widget build(BuildContext context) {
    log(transaction.nameTransaction);
    return Card(
          elevation: 4,
          child: ListTile(
            
            // ignore: unnecessary_cast
            title: Text(transaction.nameTransaction ),
           
            
            tileColor: Colors.blueGrey[50],
          ),
        );
  }
}