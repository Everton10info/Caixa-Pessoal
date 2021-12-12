
import 'package:cash_book/controllers/controllers.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ListTransactionsView extends StatelessWidget {
  var listT = Get.find<ListTrController>();
  var transaction = Get.find<Transaction>();

  @override
  Widget build(BuildContext context) {
    listT.newTransaction(transaction, listT.transactionAll);

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: listT.transactionAll.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 60,
                child: Card(
                  elevation: 4,
                  child: Card(
                    child: Column(
                      children: [
                      Text(listT.transactionAll[index].nameTransaction.toString()),
                      Text(listT.transactionAll[index].value.toString())
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
