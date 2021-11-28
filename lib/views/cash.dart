import 'dart:developer';

import 'package:cash_book/componets/card_trasaction.dart';
import 'package:cash_book/componets/modal_trasaction.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:cash_book/views/card_release.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Cash extends StatelessWidget {
   final List<CardTransaction> listCardTransactions=[];
  Transaction  transaction = Get.put(Transaction());

 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cash"),
      ),
      body: Container(
        child: CardsRelease(),
      ),
      floatingActionButton: FloatingActionButton(
          splashColor: Colors.yellowAccent,
          onPressed: () {
            Get.dialog(ModalTransaction());
            
          }),
    );
  }
}
