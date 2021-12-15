import 'package:cash_book/models/transaction_model.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ListTrController extends GetxController {
 

// ignore: deprecated_member_use
  final transactionAll = [].obs ;
  final transactionInput = [].obs;
  final transactionOutPut = [].obs;
  final transactionTotal = [].obs;

  functionSelect<List>(tr) {
    var dec = tr.typeTransaction;
    switch (dec) {
      case 'input':
        transactionInput.add(tr);
         break;

      case 'output':
        transactionOutPut.add(tr);
       break;
      default:
    }
  }
}
