import 'package:cash_book/componets/card_trasaction.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class CardsRelease extends StatelessWidget {
  final List<CardTransaction> listCardTransactions=[];
   Transaction transaction = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[200],
      child: ListView.builder(
        itemCount:listCardTransactions.length,
        itemBuilder: (ctx, i) {
          return CardTransaction();
        },
      ),
    );
  }
}
