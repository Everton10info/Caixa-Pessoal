import 'dart:developer';

import 'package:cash_book/controllers/listTransactionController.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardTransaction extends StatelessWidget {
 var transaction = Get.put(Transaction());
 ListTransactionController listTransactionController = Get.find();

 
   
  @override
  Widget build(BuildContext context) {
    log(transaction.nameTransaction);
    return Card(
          elevation: 4,
          child: ListTile( 
            title: Text('data'),
            //Text(transaction.nameTransaction ),
           
            
            tileColor: Colors.blueGrey[50],
          ),
        );
  }
}