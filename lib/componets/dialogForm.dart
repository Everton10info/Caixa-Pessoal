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
                  hintText: 'Nome da transação',
                ),
              ),
              Divider(),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: controllerValue,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Valor da transação',
                ),
              ),
              CheckboxListTile(
                title: Text('Receita?'),
                activeColor: Colors.blue,
                value: listTrController.receita.value,
                onChanged: (bool? valor) {
                  listTrController.receita.value = valor!;
                  listTrController.despesa.value =false ;
                  if (listTrController.receita == true) {
                    transaction.typeTransaction = 'input';
                   
                  }else{transaction.typeTransaction ='';}
                },
              ),
              CheckboxListTile(
                title: Text('Despesa?'),
                activeColor: Colors.blue,
                value: listTrController.despesa.value,
                onChanged: (bool? valor) {
                  listTrController.despesa.value = valor!;
                  listTrController.receita.value= false ;
                  if (listTrController.despesa == true) {
                    transaction.typeTransaction = 'output';
                  }else{transaction.typeTransaction ='';}
                },
              ),
              TextButton.icon(
                onPressed: () {
                  transaction.nameTransaction = controllerName.text;
                  transaction.value = double.parse(controllerValue.text);
                  listTrController.buttonFunctionAdd(transaction,transaction.value);
                  listTrController.transactionAll.add(transaction);
                 

                  Get.to(()=>ListTransactionsView());
              
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
