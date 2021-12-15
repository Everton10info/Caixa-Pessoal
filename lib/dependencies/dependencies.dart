

import 'package:cash_book/controllers/controllers.dart';
import 'package:get/get.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListTrController>(() => ListTrController());    
   
    
  }
}
