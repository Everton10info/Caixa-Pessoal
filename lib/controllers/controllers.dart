import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';


class ListTransactionController extends GetxController{
  Transaction transaction = Get.find<Transaction>();

final Map<String,List<dynamic>> transactionInput=Map as Map<String, List>;

classific(){
  if(transaction.typeTransaction=='input'){
    transactionInput['inputs'] = transaction.nameTransaction as List; 
    return transactionInput['inputs'];

    
  }
}








}

