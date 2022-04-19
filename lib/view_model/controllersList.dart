import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helperDatabase/transactionHelpers.dart.dart';

import 'package:shared_preferences/shared_preferences.dart';

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

  TextEditingController? controllerValueEdition = TextEditingController();
  TextEditingController? controllerNameEdition = TextEditingController();
  TextEditingController? controllerTypeEdition = TextEditingController();
  TextEditingController? controllerDueEdition = TextEditingController();
  TransactionM? trUpdate;
  // RxList<TransactionM>? trPay;
  RxDouble totalInput = 0.0.obs;
  RxDouble totalOutput = 0.0.obs;
  RxList<String> payYes = [''].obs;
  RxDouble sumTotal = 0.0.obs;

//edição de pagamento
  editionPay(trPay) async {
    int result = await db.updateTr(trPay);
    if (!result.isNaN) {}
    getTransactions();
  }

  // pega dados para edição de pagamento
  setPay(String name, String type, DateTime due, double valor, int id) {
    getTransactions();
    Rx<TransactionM> trPay = Rx(TransactionM(
      id: id,
      nameTransaction: name,
      dueDate: due,
      typeTransaction: type = 'payment',
      valor: valor,
    ));
    editionPay(trPay);
  }

  setNotPay(String name, String type, DateTime due, double valor, int id) {
    getTransactions();
    Rx<TransactionM> trPay = Rx(TransactionM(
      id: id,
      nameTransaction: name,
      dueDate: due,
      typeTransaction: type = 'output',
      valor: valor,
    ));

    editionPay(trPay);
  }

  setEdition(String name, String type, DateTime due, double valor, int id) {
    getTransactions();
    trUpdate = TransactionM(
      id: id,
      nameTransaction: name,
      dueDate: due,
      typeTransaction: type,
      valor: valor,
    );
  }

  editionUpdate(tr) async {
    int result = await db.updateTr(tr);
    if (!result.isNaN) {}
    getTransactions();
  }

  void addTransaction(Rx<TransactionM> tr) async {
    int result = await db.insertTransaction(tr);
    if (!result.isNaN) {}
  }

  getItemPref() async {
    final _prefs = await SharedPreferences.getInstance();
    if (_prefs != null) {
      print('pegou');
      payYes.value = _prefs.getStringList('listId') ?? [];
    } else {
      payYes.value += payYes;
    }
  }

  setItemPref() async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setStringList('listId', payYes);
  }

  getTransactions() async {
    getItemPref();

    ;
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

    sumTotal.value = (await db.sumTotal() ?? 0);

    transactionAll.value = await listAll();

// inputs render

    Future<List<TransactionM>> listInput() async {
      transactionHellperInput = await db.listInputDb();

      return List.generate(transactionHellperInput.length, (i) {
        return TransactionM(
          id: transactionHellperInput[i]['id'],
          nameTransaction: transactionHellperInput[i]['nameTransaction'],
          typeTransaction: transactionHellperInput[i]['typeTransaction'],
          dueDate: DateTime.parse(transactionHellperInput[i]['dueDate']),
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
          dueDate: DateTime.parse(transactionHellperOutput[i]['dueDate']),
          valor: transactionHellperOutput[i]['valor'],
        );
      });
    }

    totalOutput.value = (await db.outputTotal() ?? 0);

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
  }

  removeTransaction(
    int id,
  ) async {
    await db.delete(id);
    payYes.removeWhere(
      (element) => element == id,
    );
    setItemPref();
    getTransactions();
  }

  pay(
    int id,
  ) async {
    String? ids = id.toString();

    if (payYes.contains(ids) == false) {
      payYes.add(ids);
    } else {
      payYes.removeWhere(
        (element) => element == ids,
      );
      print('removeu $ids');
    }

    setItemPref();
    getTransactions();
  }
}
