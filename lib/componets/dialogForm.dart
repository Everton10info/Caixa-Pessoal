import 'package:cash_book/controllers/controllers.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:cash_book/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogFrom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controllerName = TextEditingController();
    var controllerValue = TextEditingController();
    var transaction =Get.find<Transaction>();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: Get.height * 0.4,
        child: Column(
          children: [
            TextFormField(
                controller:controllerName,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
            Divider(),
            TextFormField(
              controller:controllerValue,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
            TextButton.icon(
              
              onPressed: () {
                transaction.nameTransaction= controllerName.text; 
                transaction.value= double.parse(controllerValue.text) ;
                Get.toNamed(Routes.LIST_TRANSACTIONS);
              },
              icon: Icon(Icons.add_task_outlined),
              label: Text('Adicinar trasação'),
            ),
          ],
        ),
      ),
    );
  }
}
