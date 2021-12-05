import 'package:cash_book/controllers/controllers.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer'as dev;

class ListTransactionsView extends StatelessWidget {
 ListTransactionController listTransactionController = Get.find<ListTransactionController>();
var tr = ListTransactionController().transactionInput.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
      ),
  
      body: Container(child: Text('$tr'),
        height: Get.height * 015,
      ),
    );
  }
}
