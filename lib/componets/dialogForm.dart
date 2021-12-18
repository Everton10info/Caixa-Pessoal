import 'package:cash_book/controllers/controllersList.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:cash_book/views/list_transaction_all.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogFrom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerValue = TextEditingController();
    final listTrController = Get.find<ListTrController>();
    final transaction = Transaction();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: Get.height * 0.4,
        child: Obx(
          () => Column(
            children: [
              TextFormField(
                controller: controllerName,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
              Divider(),
              TextFormField(
                controller: controllerValue,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
              CheckboxListTile(
                title: Text('Receita?'),
                activeColor: Colors.blue,
                value: listTrController.receita.value,
                onChanged: (bool? valor) {
                  listTrController.receita.value = valor!;
                  if (listTrController.receita == true) {
                    transaction.typeTransaction = 'input';
                    debugPrint('print input!!!!!!!!!!!!!!');
                  }
                },
              ),
              CheckboxListTile(
                title: Text('Despesa?'),
                activeColor: Colors.blue,
                value: listTrController.despesa.value,
                onChanged: (bool? valor) {
                  listTrController.despesa.value = valor!;
                  if (listTrController.despesa == true) {
                    transaction.typeTransaction = 'output';
                  }
                },
              ),
              TextButton.icon(
                onPressed: () {
                  transaction.nameTransaction = controllerName.text;
                  transaction.value = double.parse(controllerValue.text);
                  listTrController.transactionAll.add(transaction);
                 if(transaction.typeTransaction == 'input'){
                   debugPrint('condição input');
                   listTrController.transactionInput.add(transaction);  

                  }
                  if(transaction.typeTransaction == 'output'){
                    listTrController.transactionOutput.add(transaction);  
                  } 

                  Get.back();
                  Get.to(ListTransactionsView());
                },
                icon: Icon(Icons.add_task_outlined),
                label: Text('Adicinar trasação'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
