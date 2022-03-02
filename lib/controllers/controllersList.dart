import 'package:cash_book/helperDatabase/transactionHelpers.dart.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../helperDatabase/transactionHelpers.dart.dart';

class ListTrController extends GetxController {
  var db = TransactionsHelpers();

  RxList<TransactionM> transactionInput = RxList<TransactionM>();
  RxList<TransactionM> transactionOutput = RxList<TransactionM>();
  RxList<TransactionM> transactionAll = RxList<TransactionM>();

  RxDouble totalInput = 0.0.obs;
  RxDouble totalOutput = 0.0.obs;
  RxBool receita = false.obs;
  RxBool despesa = false.obs;
  RxDouble sumTotal = 0.0.obs;

  void addTransaction(Rx<TransactionM> tr) async {
    int result = await db.insertTransaction(tr);
    if (!result.isNaN) {
      print('caregou novo');
    }
    ;
  }

  void listAll() async {
    List trAll = await db.list();
    transactionAll;
    for (var i = 0; i < trAll.length; i++) {
      transactionAll.add(TransactionM.fromJson(trAll[i]));
      if (transactionAll[i].typeTransaction == 'input') {
        transactionInput.add(transactionAll[i]);

        totalInput.value = totalInput.value + transactionAll[i].valor;
      }
      if (transactionAll[i].typeTransaction == 'output') {
        transactionOutput.add(transactionAll[i]);
      }
    }
  }

  removeTrasaction(
    int id,
  ) async {
    await db.delete(id);
  }
}
