import 'package:cash_book/models/transaction_model.dart';
import 'package:get/get.dart';
import '../helperDatabase/transactionHelpers.dart.dart';

class ListTrController extends GetxController {
  var db = TransactionsHelpers();

  RxList<TransactionM> transactionInput = RxList<TransactionM>();
  RxList<TransactionM> transactionOutput = RxList<TransactionM>();
  RxList<TransactionM> transactionAll = RxList<TransactionM>();
  List<Map<String, dynamic>> transactionHellperAll = [];
  List<Map<String, dynamic>> transactionHellperInput = [];
  List<Map<String, dynamic>> transactionHellperOutput = [];

  RxDouble totalInput = 0.0.obs;
  RxDouble totalOutput = 0.0.obs;

  RxDouble sumTotal = 0.0.obs;

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
          valor: transactionHellperAll[i]['valor'],
        );
      });
    }

    sumTotal.value = await db.sumTotal() ?? 0;

    transactionAll.value = await listAll();

// inputs render

    Future<List<TransactionM>> listInput() async {
      transactionHellperInput = await db.listInputDb();

      return List.generate(transactionHellperInput.length, (i) {
        return TransactionM(
          id: transactionHellperInput[i]['id'],
          nameTransaction: transactionHellperInput[i]['nameTransaction'],
          typeTransaction: transactionHellperInput[i]['typeTransaction'],
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
          valor: transactionHellperOutput[i]['valor'],
        );
      });
    }

    totalOutput.value = await db.outputTotal() ?? 0;

    transactionOutput.value = await listOutPut();
  }

  removeTransaction(
    int id,
  ) async {
    await db.delete(id);

    getTransactions();
  }
}
