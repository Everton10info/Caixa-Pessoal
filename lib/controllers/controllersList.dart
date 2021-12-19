import 'package:cash_book/models/transaction_model.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ListTrController extends GetxController {
  late RxList transactionAll = [].obs;
  late RxList transactionInput = [].obs;
  late RxList transactionOutput = [].obs;
  late RxList transactionTotal = [].obs;
  var receita = false.obs;
  var despesa = false.obs;

  buttonFunctionAdd(transaction) {
    transactionAll.add(transaction);
    if (transaction.typeTransaction == 'input') {
      transactionInput.add(transaction);
    } else if (transaction.typeTransaction == 'output') {
      transactionOutput.add(transaction);
    }

    Get.back();
  }

  removeTrasaction(transaction){
    transaction.Delete();
  }
}
