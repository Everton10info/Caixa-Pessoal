
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
    } else {
      transactionOutput.add(transaction);
    }


    Get.back();
  }

  removeTrasaction(tr,id){
tr.removeWhere((tr)=> tr == id);
   
    
  }
}
