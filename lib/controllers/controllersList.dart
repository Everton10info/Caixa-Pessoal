import 'package:cash_book/helperDatabase/transactionHelpers.dart.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:cash_book/views/list_transactions_input.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import '../helperDatabase/transactionHelpers.dart.dart';

class ListTrController extends GetxController {
  var db = Get.find<TransactionsHelpers>();
   

  final RxList<TransactionM> transactionInput = RxList<TransactionM>();
   final RxList<TransactionM> transactionOutput = RxList<TransactionM>();
  final RxList<TransactionM> transactionAll = RxList<TransactionM>();
  late RxList transactionTotal = [].obs;
  var totalInput = 0.0.obs;
  var totalOutput = 0.0.obs;
  var receita = false.obs;
  var despesa = false.obs;
  var sumTotal = 0.0.obs;
  late RxList tempList;
  buttonFunctionAdd(transaction, value) async {
    if (transaction.typeTransaction == 'input') {
      totalInput.value += value as double;
    } else if (transaction.typeTransaction == 'output') {
     // transactionOutput.add(transaction);
      totalOutput.value += value as double;
    } else {
      return;
    }
    // transactionAll.add(transaction);
    Get.back();
    sumTotal.value = totalInput.value - totalOutput.value;
  }

  void addTransaction(Rx<TransactionM> tr) async {
    int result = await db.insertTransaction(tr);
    if (result != null) {}
  }

  void listAll() async {
    List trAll = await db.list();
 RxList<TransactionM> tempAll = RxList<TransactionM>();
    for (var item in trAll) {
      tempAll.add(TransactionM.fromJson(item));
      

    }

   transactionAll.value = tempAll;
  }



  void inputs() async {
    List trAll = await db.listInput();
 RxList<TransactionM> tempInput = RxList<TransactionM>();
    for (var item in trAll) {
      tempInput.add(TransactionM.fromJson(item));
      totalInput.value += tempInput[0].valor;
        print(tempInput[0].typeTransaction);
    }
    sumTotal.value = totalInput.value - totalOutput.value;
   transactionInput.value = tempInput;
  }

  void outputs() async {
    List trAll = await db.listOutput();
 RxList<TransactionM> tempOutput = RxList<TransactionM>();
    for (var item in trAll) {
      tempOutput.add(TransactionM.fromJson(item));
        totalOutput.value += tempOutput[0].valor;
        print(tempOutput[0].typeTransaction);
    }
sumTotal.value = totalInput.value - totalOutput.value;
   transactionOutput.value = tempOutput;
  }

/* 
  removeTrasactionInput(id, value) {
    transactionInput.removeWhere((tr) => tr.id == id);
    transactionAll.removeWhere((tr) => tr.id == id);
    totalInput - value;
    sumTotal.value = totalInput.value - totalOutput.value;
  }

  removeTrasactionOutput(id, value) {
    transactionOutput.removeWhere((tr) => tr.id == id);
    transactionAll.removeWhere((tr) => tr.id == id);
    totalOutput - value;
    sumTotal.value = totalInput.value - totalOutput.value;
  } */
}
