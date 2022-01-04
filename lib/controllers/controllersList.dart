import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListTrController extends GetxController {
  dataLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
 
  }

  late RxList transactionInput = [].obs;
  late RxList transactionOutput = [].obs;
  late RxList transactionAll = [].obs;
  late RxList transactionTotal = [].obs;
  var totalInput = 0.0.obs;
  var totalOutput = 0.0.obs;
  var receita = false.obs;
  var despesa = false.obs;
  var sumTotal = 0.0.obs;
 
  buttonFunctionAdd(transaction, value) {
    if (transaction.typeTransaction == 'input') {
      transactionInput.add(transaction);
      totalInput.value += value as double;
    } else if (transaction.typeTransaction == 'output') {
      transactionOutput.add(transaction);
      totalOutput.value += value as double;
    } else {
      return;
    }
    Get.back();
    sumTotal.value = totalInput.value - totalOutput.value;
  }

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
  }
}
