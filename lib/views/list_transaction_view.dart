import 'package:cash_book/componets/card_transaction.dart';
import 'package:cash_book/controllers/controllers.dart';
import 'package:cash_book/models/transaction_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;

class ListTransactionsView extends StatelessWidget {
  ListTrController listTrController =
      Get.find<ListTrController>();
      Transaction transaction = Get.find<Transaction>();

     


  @override
  Widget build(BuildContext context) {
  listTrController.transactionAll;
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: listTrController.transactionAll.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return Card(
                
          elevation: 4,
          child: CardTransaction(),
           color: Colors.green[50],
        
        );
            
              
            }),
      ),
    );
  }
}
