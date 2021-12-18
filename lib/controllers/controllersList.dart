import 'package:get/get.dart';
import 'package:get/state_manager.dart';


class ListTrController extends GetxController {

  late RxList transactionAll = [].obs;
  late RxList transactionInput = [].obs;
  late RxList transactionOutput = [].obs;
  late RxList transactionTotal = [].obs;
  var receita = false.obs;
  var despesa = false.obs;

  functionAddAll(tr){

 transactionAll.add(tr);
 
  }

  functionSelect<RxList>(tr) {
    switch (tr) {
      case 'input':
        transactionInput.add(tr);
        break;

      case 'output':
        transactionOutput.add(tr);
        break;
      default:
    }
  }
}
