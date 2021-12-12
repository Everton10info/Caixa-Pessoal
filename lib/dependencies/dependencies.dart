
import 'package:cash_book/componets/cards_all.dart';
import 'package:cash_book/controllers/controllers.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:get/get.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
   // Get.lazyPut<CardTransaction>(() => CardTransaction());
    Get.lazyPut<Transaction>(() => Transaction());
    Get.lazyPut<ListTrController>(() => ListTrController());    
    Get.lazyPut<CardsAll>(() => CardsAll());
    
  }
}
