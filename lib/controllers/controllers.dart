import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ListTrController extends GetxController {
  Transaction transaction = Get.find<Transaction>();
    
  List transactionAll = [].obs;
  List transactionInput = [].obs;
  List transactionOutPut = [].obs;
  List transactionTotal = [].obs;




  newTransaction<List>(tr , transactionAll){
 return transactionAll.add(tr) ;  
 
  }




  functionSelect<List>(tr,transactionAll) {
    var dec = tr.typeTransaction;
    switch (dec) {
      case 'input':
        transactionInput.add(tr);
        return transactionInput.obs;

      case 'output':
        transactionOutPut.add(tr);
        return transactionOutPut.obs;
      default:
    }
  }



}


