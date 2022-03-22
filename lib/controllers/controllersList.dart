import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helperDatabase/transactionHelpers.dart.dart';

class ListTrController extends GetxController {
  var db = TransactionsHelpers();

  RxList<TransactionM> transactionInput = RxList<TransactionM>();
  RxList<TransactionM> transactionOutput = RxList<TransactionM>();
  RxList<TransactionM> transactionAll = RxList<TransactionM>();
  RxList<TransactionM> transactionTimeEnd = RxList<TransactionM>();
  List<Map<String, dynamic>> transactionHellperAll = [];
  List<Map<String, dynamic>> transactionHellperInput = [];
  List<Map<String, dynamic>> transactionHellperOutput = [];
  List<Map<String, dynamic>> transactionHellperTimeEnd = [];
  RxBool venceu = false.obs;
  
 var dueEd;
  var idEd;
  TextEditingController? controllerValueEdition = TextEditingController();
  TextEditingController? controllerNameEdition = TextEditingController();
  TextEditingController? controllerTypeEdition = TextEditingController();
  TextEditingController? controllerDueEdition = TextEditingController();
  Rx<TransactionM>? trUpdate;
  RxDouble totalInput = 0.0.obs;
  RxDouble totalOutput = 0.0.obs;

  RxDouble sumTotal = 0.0.obs;

   setEdition(String name, String type, DateTime due, double valor, int id)  {
  
    trUpdate = Rx(
      TransactionM(
        id: id,
        nameTransaction: name,
        dueDate: due,
        typeTransaction: type,
        valor: valor,
      ),
    );
 
  }

   editionUpdate(tr) async {
     //tr.value.nameTransaction = controllerNameEdition!.text;
     tr.value.dueDate= dueEd;
    int result = await db.updateTr(tr);
    if (!result.isNaN) {
      print('caregou editado ');
    }
    getTransactions();
     
  }

  void addTransaction(Rx<TransactionM> tr) async {
    int result = await db.insertTransaction(tr);
    if (!result.isNaN) {
      print('caregou novo');
    }
  }

  getTransactions() async {
    //all render

    Future<List<TransactionM>> listAll() async {
      transactionHellperAll = await db.list();

      return List.generate(transactionHellperAll.length, (i) {
        return TransactionM(
          id: transactionHellperAll[i]['id'],
          nameTransaction: transactionHellperAll[i]['nameTransaction'],
          typeTransaction: transactionHellperAll[i]['typeTransaction'],
          dueDate: DateTime.parse(transactionHellperAll[i]['dueDate']),
          valor: transactionHellperAll[i]['valor'],
        );
      });
    }

    sumTotal.value = await db.sumTotal() ?? 0;

    transactionAll.value = await listAll();
    print('${transactionAll}');

// inputs render

    Future<List<TransactionM>> listInput() async {
      transactionHellperInput = await db.listInputDb();

      return List.generate(transactionHellperInput.length, (i) {
        return TransactionM(
          id: transactionHellperInput[i]['id'],
          nameTransaction: transactionHellperInput[i]['nameTransaction'],
          typeTransaction: transactionHellperInput[i]['typeTransaction'],
          dueDate: DateTime.parse(transactionHellperAll[i]['dueDate']),
          valor: transactionHellperInput[i]['valor'],
        );
      });
    }

    totalInput.value = await db.inputTotal() ?? 0;

    transactionInput.value = await listInput();

//output render

    Future<List<TransactionM>> listOutPut() async {
      transactionHellperOutput = await db.listOutputDb();

      return List.generate(transactionHellperOutput.length, (i) {
        return TransactionM(
          id: transactionHellperOutput[i]['id'],
          nameTransaction: transactionHellperOutput[i]['nameTransaction'],
          typeTransaction: transactionHellperOutput[i]['typeTransaction'],
          dueDate: DateTime.parse(transactionHellperAll[i]['dueDate']),
          valor: transactionHellperOutput[i]['valor'],
        );
      });
    }

    totalOutput.value = await db.outputTotal() ?? 0;

    transactionOutput.value = await listOutPut();

    Future<List<TransactionM>> listTimeEnd() async {
      transactionHellperTimeEnd = await db.listTimeEndDb();

      return List.generate(transactionHellperTimeEnd.length, (i) {
        return TransactionM(
          id: transactionHellperTimeEnd[i]['id'],
          nameTransaction: transactionHellperTimeEnd[i]['nameTransaction'],
          typeTransaction: transactionHellperTimeEnd[i]['typeTransaction'],
          dueDate: DateTime.parse(transactionHellperTimeEnd[i]['dueDate']),
          valor: transactionHellperTimeEnd[i]['valor'],
        );
      });
    }

    transactionTimeEnd.value = await listTimeEnd();
    print('$transactionTimeEnd');
  }

  removeTransaction(
    int id,
  ) async {
    await db.delete(id);

    getTransactions();
  }
}
