import 'package:cash_book/controllers/controllersList.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:cash_book/views/list_transaction_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DialogFrom extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final trKey = GlobalKey<FormFieldState>();
  final valueKey = GlobalKey<FormFieldState>();
  final listTrController = Get.find<ListTrController>();

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerValue = TextEditingController();
  final RxString typeTransaction = ''.obs;
  final RxString nameTransaction = ''.obs;
  final RxDouble valor = 0.0.obs;
     var id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: Get.height * 0.5,
        child: Obx(
          () => Column(
            children: [
              TextFormField(
                key: trKey,
                validator: (String? value) {
                  if (value!.length < 3) {
                    return 'Nome inválido';
                  }
                },
                inputFormatters: [
                  LengthLimitingTextInputFormatter(28),
                ],
                controller: controllerName,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Nome da transação',
                ),
              ),
              // Divider(),
              TextFormField(
                key: valueKey,
                validator: (String? value) {
                  if (value!.length < 1) {
                    return 'Valor inválido';
                  }
                },
                inputFormatters: [
                  LengthLimitingTextInputFormatter(7),
                ],
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
                  listTrController.despesa.value = false;
                  listTrController.receita.value
                      ? typeTransaction.value = 'input'
                      : typeTransaction.value = '';
                },
              ),
              CheckboxListTile(
                  title: Text('Despesa?'),
                  activeColor: Colors.blue,
                  value: listTrController.despesa.value,
                  onChanged: (bool? valor) {
                    listTrController.despesa.value = valor!;
                    listTrController.receita.value = false;

                    listTrController.despesa.value
                        ? typeTransaction.value = 'output'
                        : typeTransaction.value = '';
                  }),

              Container(
                child: TextButton.icon(
                  onPressed: () async {
                    trKey.currentState?.validate();
                    valueKey.currentState?.validate();
                    if (typeTransaction == '') {
                      Get.snackbar('Escolha uma opção ', 'RECEITA OU DESPESA?');
                    } else {
                      nameTransaction.value = controllerName.text;
                      var valorTemp= double.parse(controllerValue.text);
                      if(typeTransaction == 'input'){
                        valor.value = valorTemp;
                      }
                      if(typeTransaction == 'output'){
                        valor.value = valorTemp * (-1);
                      }

                   
                      Rx<TransactionM> transaction = Rx(
                        TransactionM(
                          nameTransaction: nameTransaction.value,
                          typeTransaction: typeTransaction.value,
                          id: id,
                          valor: valor.value,
                        ),
                      );

                      listTrController.addTransaction(transaction);
                      listTrController.listAll();
                     

                      await Get.to(() => ListTransactionsView());

                      Get.back();
                    }
                  },
                  icon: Icon(Icons.add_task_outlined),
                  label: Text('Adicinar movimentação'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
