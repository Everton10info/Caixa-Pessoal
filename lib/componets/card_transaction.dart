import 'package:cash_book/controllers/controllers.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardTransaction extends StatelessWidget {
   var listT = Get.find<ListTrController>();
  var transaction = Get.find<Transaction>();


  @override
  Widget build(BuildContext context) {

listT.newTransaction(transaction, listT.transactionAll);
listT.functionSelect(transaction,listT.transactionAll);



  //listT.functionSelect();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      
      
        child: Text('${listT.transactionOutPut[0].nameTransaction}'),
      ),
    );
  }
}